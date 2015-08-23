//
//  tchClassPDFexporter.m
//  Teechers App
//
//  Created by fran on 8/22/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassPDFexporter.h"

#import "AClass.h"

#import "Student.h"
#import "ClassDay.h"
#import "AttendanceRecord.h"
#import "Evaluation.h"
#import "GradeRecord.h"

@interface tchClassPDFexporter()

@property (nonatomic) float generalRowHeight, generalTightColumnWidth, generalXmargin, generalYmargin; // cell properties
@property (nonatomic) float pageWidth, pageHeight, pageMarginX, pageMarginY; // page properties
@property (nonatomic) float studentStartingX, studentStartingY; // table zero coordinates
@property (nonatomic) float attendanceStartingX, attendanceStartingY; // attendance zero coordinates
@property (nonatomic) float gradesStartingX, gradesStartingY; // grades zero coordinates

@property (strong,nonatomic) AClass* activeClass; // the class to work upon
@property (strong,nonatomic) NSArray* studentArray; // student array
@property (strong,nonatomic) NSArray* daysArray; // class day array
@property (strong,nonatomic) NSArray* evaluationsArray; // evaluations array

@end

@implementation tchClassPDFexporter

-(NSString*)getPDFforClass:(AClass*)aClass
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"classshare.pdf"];
    
    NSData *pdfData = [self generatePDFforClass:aClass]; // data representing your created PDF
    NSError *error = nil;
    
    if ([pdfData writeToFile:filePath options:NSDataWritingAtomic error:&error]) {
        // file saved
    } else {
        // error writing file
        NSLog(@"Unable to write PDF to %@. Error: %@", filePath, error);
    }
    
    // return the file path
    return filePath;
    
}

#pragma mark - Set PDF visual styles
- (void)setPDFstyles{
    
    self.generalRowHeight = 20.0;
    self.generalTightColumnWidth = 30.0;
    self.generalXmargin = 2.5;
    self.generalYmargin = 2.5;
    
    self.pageWidth = 842.0;
    self.pageHeight = 595.0;
    self.pageMarginX = 40.0;
    self.pageMarginY = 35.0;
    
    self.studentStartingX = 40.0;
    self.studentStartingY = 120.0;
    
}


#pragma mark - Add Title to page
-(void)addPageTitle
{

    
    // Add page title -------------------------------------
    
    // element text
    NSString *pageTitle = self.activeClass.name;
    // element font
    UIFont *pageTitleFont = [UIFont fontWithName:@"Avenir" size:24.0f];
    // element attributes
    NSDictionary *pageTitleAttrDict = @{NSFontAttributeName:pageTitleFont};
    // element sizing
    CGSize pageTitleSize = [pageTitle sizeWithAttributes:pageTitleAttrDict];
    // element boxing
    CGRect pageTitleRect = CGRectMake(40.0, 40.0, pageTitleSize.width, pageTitleSize.height);
    // draw in page
    [pageTitle drawInRect:pageTitleRect withAttributes:pageTitleAttrDict];
    
    
}

#pragma mark - Add Student Name
-(void)addCellForStudent:(Student*)student atIndex:(NSInteger)index
{
    float studentHeight = self.generalRowHeight;    // cell height
    float studentWidth = 200.0;                     // cell width
    
    UIFont *studentFont = [UIFont fontWithName:@"Avenir" size:12.0f];       // element font
    NSDictionary *studentAttrDict = @{NSFontAttributeName:studentFont};     // element attributes
    CGSize studentSize = CGSizeMake(studentWidth, self.generalRowHeight);   // element sizing
    
    // change the text of the element
    NSString *studentElement = student.name;
    
    // create the rectangle
    float currentY = (self.studentStartingY + ((studentHeight + self.generalYmargin) * index));
    CGRect studentRect = CGRectMake(self.studentStartingX, currentY, studentSize.width, studentSize.height);
    
    // add it to the page
    [studentElement drawInRect:studentRect withAttributes:studentAttrDict];
    
}

#pragma mark - Add day Title
-(void)addCellForDayTitle:(ClassDay*)currentDay atIndex:(NSInteger)index
{
    
    // general  attributes & settings ---------------
    float attendanceWidth = self.generalTightColumnWidth;
    float attendanceHeight = self.generalRowHeight;
    
    
    UIFont *attendanceFont = [UIFont fontWithName:@"Avenir" size:12.0f];               // element font
    NSMutableParagraphStyle *attendanceParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    attendanceParagraph.alignment = NSTextAlignmentCenter;                             // element paragraph settings
    NSDictionary *attendanceAttrDict = @{NSFontAttributeName:attendanceFont, NSParagraphStyleAttributeName:attendanceParagraph};                            // element attributes
    
    
    CGSize attendanceSize = CGSizeMake(attendanceWidth, attendanceHeight);             // element sizing
    
    NSString *dayText = @"";
    
    NSDate *fullDate = currentDay.date;                             // get the name for that day
    NSDateFormatter *tempDF = [[NSDateFormatter alloc] init];       // initialize date formatter
    tempDF.dateFormat = @"MMM/dd";                                  // get month from date
    dayText = [[tempDF stringFromDate:fullDate] uppercaseString];   // uppercase
    
    
    // create the rectangle
    float targetX = self.attendanceStartingX + (index * (attendanceWidth + self.generalXmargin));
    float targetY = self.attendanceStartingY - (attendanceHeight + (self.generalYmargin *2));
    CGRect dayRect = CGRectMake(targetX, targetY, attendanceSize.width, attendanceSize.height);
    
    
    // add it to the page
    [dayText drawInRect:dayRect withAttributes:attendanceAttrDict];
    
}

#pragma mark - Add day record cell
-(void)addCellForDay:(ClassDay*)day andStudent:(Student*)aStudent withDayIndex:(NSInteger)dayIndex andStudentIndex:(NSInteger)studentIndex
{
    // general  attributes & settings ---------------
    float attendanceWidth = self.generalTightColumnWidth;
    float attendanceHeight = self.generalRowHeight;
    
    UIFont *attendanceFont = [UIFont fontWithName:@"Avenir" size:12.0f];               // element font
    NSMutableParagraphStyle *attendanceParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    attendanceParagraph.alignment = NSTextAlignmentCenter;                             // element paragraph settings
    NSDictionary *attendanceAttrDict = @{NSFontAttributeName:attendanceFont, NSParagraphStyleAttributeName:attendanceParagraph};                            // element attributes
    
    
    CGSize attendanceSize = CGSizeMake(attendanceWidth, attendanceHeight);             // element sizing
    
    
    // create the return string
    NSString *attendanceText = @"-";
    
    // look for the record belonging to that day
    AttendanceRecord *currentRecord = [aStudent getAttendanceRecordForDay:day];
    
    // if the record exists…
    if (currentRecord.status) {
        
        // attendance statuses array
        NSArray *statusArray = [NSArray arrayWithObjects:@"P", @"A", @"L", nil];
        
        // get the text
        attendanceText = [statusArray objectAtIndex:[currentRecord.status integerValue]];
        
    }
    
    // create the rectangle
    float targetX = self.attendanceStartingX + (dayIndex * (attendanceWidth + self.generalXmargin));
    float targetY = self.attendanceStartingY + (studentIndex * (attendanceHeight + self.generalYmargin));
    CGRect attendanceRect = CGRectMake(targetX, targetY, attendanceSize.width, attendanceSize.height);
    
    // add it to the page
    [attendanceText drawInRect:attendanceRect withAttributes:attendanceAttrDict];
    
}

#pragma mark - Add grade title
-(void)addCellForGradeTitle:(Evaluation*)evaluation atIndex:(NSInteger)index
{
    
    
    float gradeWidth = self.generalTightColumnWidth;
    float gradeHeight = self.generalRowHeight;
    
    // element font
    UIFont *gradeFont = [UIFont fontWithName:@"Avenir" size:12.0f];
    // element paragraph settings
    NSMutableParagraphStyle *gradeParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    gradeParagraph.alignment = NSTextAlignmentCenter;
    // element attributes
    NSDictionary *gradeAttrDict = @{NSFontAttributeName:gradeFont, NSParagraphStyleAttributeName:gradeParagraph};
    // element sizing
    CGSize gradeSize = CGSizeMake(gradeWidth, gradeHeight);
    
    
    // get the name for that day
    NSString *evalText = evaluation.nameShort;
    
    // create the rectangle
    float targetX = self.gradesStartingX + (index * (gradeWidth + self.generalXmargin));
    float targetY = self.gradesStartingY - (gradeHeight + (self.generalYmargin *2));
    CGRect gradeRect = CGRectMake(targetX, targetY, gradeSize.width, gradeSize.height);
    
    // add it to the page
    [evalText drawInRect:gradeRect withAttributes:gradeAttrDict];
    
    
}

#pragma mark - Add grade record cell
-(void)addCellForGrade:(Evaluation*)grade andStudent:(Student*)aStudent withGradeIndex:(NSInteger)gradeIndex andStudentIndex:(NSInteger)studentIndex
{
    float gradeWidth = self.generalTightColumnWidth;
    float gradeHeight = self.generalRowHeight;
    
    
    UIFont *gradeFont = [UIFont fontWithName:@"Avenir" size:12.0f];     // element font
    NSMutableParagraphStyle *gradeParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];   // element paragraph settings
    gradeParagraph.alignment = NSTextAlignmentCenter;
    NSDictionary *gradeAttrDict = @{NSFontAttributeName:gradeFont, NSParagraphStyleAttributeName:gradeParagraph};   // element attributes
    CGSize gradeSize = CGSizeMake(gradeWidth, gradeHeight); // element sizing
    
    
    // reset text
    NSString *gradeText = @"-";
    
    // look for the record belonging to that day
    GradeRecord* currentRecord = [aStudent getGradeForEvaluation:grade];
    
    // if the record exists…
    if (currentRecord.grade) {
        // get the text
        gradeText = [NSString stringWithFormat:@"%@", currentRecord.grade];
    }
    
    // create the rectangle
    float targetX = self.gradesStartingX + (gradeIndex * (gradeWidth + self.generalXmargin));
    float targetY = self.gradesStartingY + (studentIndex * (gradeHeight + self.generalYmargin));
    CGRect gradeRect = CGRectMake(targetX, targetY, gradeSize.width, gradeSize.height);
    
    // add it to the page
    [gradeText drawInRect:gradeRect withAttributes:gradeAttrDict];
    
}

#pragma mark - Generate PDF
-(NSData*)generatePDFforClass:(AClass*)aClass
{
    
    
    // initialize the pdf data
    NSMutableData *pdfData = [NSMutableData data];
    
    // PDF metadata
    NSDictionary *pdfMetaData = [NSDictionary dictionaryWithObjectsAndKeys:@"Class Export", kCGPDFContextTitle, @"Teechers app", kCGPDFContextCreator, nil];
    
    // initialize the PDF CONTEXT
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, pdfMetaData);
    
    // set the PDF styles
    [self setPDFstyles];
    
    
    
    
    // --------------------------------------------------------------------------------
    // General Settings
    // --------------------------------------------------------------------------------
    
    
    self.activeClass = aClass;
    self.studentArray = [self.activeClass getStudentsSorted];
    self.daysArray = [self.activeClass getDaysSorted];
    self.evaluationsArray = [self.activeClass getEvaluationsSorted];
    
    // Get rows per page -------------------------------------
    float usableArea = self.pageHeight - self.studentStartingY - self.pageMarginY;  // get vertical usable area
    float rowAmount = floorf( usableArea / (self.generalRowHeight + self.generalYmargin) );  // get row amount
    
    // counters
    NSInteger rowCount = 0;
    NSInteger currentPage = 0;
    NSInteger maxPageCount = floor([self.studentArray count] / rowAmount);
    
    
    // --------------------------------------------------------------------------------
    // Loop for pages
    // --------------------------------------------------------------------------------
    
    do {
        
        
        // --------------------------------------------------------------------------------
        // Drawing a page
        // --------------------------------------------------------------------------------
        
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, self.pageWidth, self.pageHeight), nil);
        
        
        // Add the page title --------------------------------------------------------------------
        [self addPageTitle];
        
        
        
        // Add student list --------------------------------------------------------------------
        
        
        // get student index range
        NSInteger studentIndexStart = 0 + (currentPage * rowAmount);
        NSInteger studentIndexEnd = rowAmount + (currentPage * rowAmount);
        
        if (studentIndexEnd > [self.activeClass.students count]) {
            studentIndexEnd = [self.activeClass.students count];
        }
        
        
        
        // Add attendance & grades headers --------------------------------------------------------------------
        
        NSInteger dayIndex = 0;         // initialize day counter
        NSInteger gradeIndex = 0;       // initialize grade counter
        
        // get looping for attendance headers… ---------------
        
        self.attendanceStartingX = self.studentStartingX + 200 + (self.generalXmargin * 2);     // set starting X for attendance
        self.attendanceStartingY = self.studentStartingY;                                       // set starting Y for attendance
        
        for (ClassDay *currentDay in self.daysArray) {
            
            // add the object
            [self addCellForDayTitle:currentDay atIndex:dayIndex];
            
            // move the day counter
            dayIndex++;
            
        }
        
        // get looping for grades headers… ---------------
        
        self.gradesStartingX = self.attendanceStartingX + ((self.generalTightColumnWidth + self.generalXmargin) * [aClass.classDays count]) + (self.generalXmargin * 4);     // set starting X for attendance
        self.gradesStartingY = self.studentStartingY;                                       // set starting Y for attendance
        
        for (Evaluation *currentEval in self.evaluationsArray) {
            
            // add the object
            [self addCellForGradeTitle:currentEval atIndex:gradeIndex];
            
            // move the day counter
            gradeIndex++;
            
        }
        
        
        // get looping for student… ---------------
        for (NSInteger studentIndex = studentIndexStart; studentIndex < studentIndexEnd; studentIndex++) {
            
            
            // get the row index
            NSInteger rowIndex = studentIndex - (currentPage * rowAmount);
            
            // get the current student
            Student *currentStudent = [self.studentArray objectAtIndex:studentIndex];
            
            // draw the cell element
            [self addCellForStudent:currentStudent atIndex:rowIndex];
            
            
            
            // initialize day counter
            NSInteger dayCount = 0;
            
            // …and get looping for each day ---------------
            for (ClassDay *currentDay in self.daysArray) {
                
                
                // draw the cell element
                [self addCellForDay:currentDay andStudent:currentStudent withDayIndex:dayCount andStudentIndex:rowIndex];
                
                // advance the day counter
                dayCount++;
                
            }
            
            
            // initialize grade counter
            NSInteger gradeCount = 0;
            
            // …and get looping for each grade ---------------
            for (Evaluation *currentEval in self.evaluationsArray) {
                
                
                // draw the cell element
                [self addCellForGrade:currentEval andStudent:currentStudent withGradeIndex:gradeCount andStudentIndex:rowIndex];
                
                // advance the day counter
                gradeCount++;
                
            }
            
            
            
        }
        
        
        
        
        // advance the counter
        rowCount++;
        currentPage++;
        
    } while (currentPage <= maxPageCount);
    
    
    
    // --------------------------------------------------------------------------------
    // End of drawing a page
    // --------------------------------------------------------------------------------
    
    
    // Close the PDF CONTEXT and write the contents out.
    UIGraphicsEndPDFContext();
    
    return pdfData;
}

@end
