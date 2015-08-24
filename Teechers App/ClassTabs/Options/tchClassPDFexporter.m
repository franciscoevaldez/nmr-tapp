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
    
    // Page styles
    self.pageWidth = 842.0;
    self.pageHeight = 595.0;
    self.pageMarginX = 40.0;
    self.pageMarginY = 40.0;
    
    // Table coords
    self.studentStartingX = 40.0;
    self.studentStartingY = 120.0;
    
    // Cell Presets
    self.generalRowHeight = 20.0;
    self.generalTightColumnWidth = 30.0;
    self.generalXmargin = 2.5;
    self.generalYmargin = 2.5;
    
}


#pragma mark - Add Title to page
-(void)addPageTitle
{
    
    // set text
    NSString *pageTitle = self.activeClass.name;
    
    // set font
    UIFont *pageTitleFont = [UIFont fontWithName:@"Avenir-Heavy" size:24.0f];
    
    // set attributes in a dictionary
    NSDictionary *pageTitleAttrDict = @{NSFontAttributeName:pageTitleFont};
    
    // get sizing
    CGSize pageTitleSize = [pageTitle sizeWithAttributes:pageTitleAttrDict];
    
    // create container rectangle
    CGRect pageTitleRect = CGRectMake(40.0, 40.0, pageTitleSize.width, pageTitleSize.height);
    
    // draw in page
    [pageTitle drawInRect:pageTitleRect withAttributes:pageTitleAttrDict];
    
    
}

#pragma mark - Add Student Name
-(void)addCellForStudent:(Student*)student atIndex:(NSInteger)index
{
    
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight;    // cell height
    float cellWidth = 200.0;                     // cell width
    NSString *fontName = @"Avenir";                 // font name
    float fontSize = 12.0;                          // font size
    NSString *cellText = student.name;        // change the text of the element
    
    // -----------------------------------------------------------
    
    
    UIFont *cellFont = [UIFont fontWithName:fontName size:fontSize];       // element font
    NSDictionary *cellAttrDict = @{NSFontAttributeName:cellFont};     // element attributes
    
    // get the Y position
    float cellY = (self.studentStartingY + ((cellHeight + self.generalYmargin) * index));
    // create the object
    CGRect cellRectangle = CGRectMake(self.studentStartingX, cellY, cellWidth, cellHeight);
    
    // add it to the page
    [cellText drawInRect:cellRectangle withAttributes:cellAttrDict];
    
}

#pragma mark - Add day Title
-(void)addCellForDayTitle:(ClassDay*)currentDay atIndex:(NSInteger)index
{
    
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight*2;        // cell height
    float cellWidth = self.generalTightColumnWidth;    // cell width
    NSString *fontName = @"Avenir-Heavy";             // font name
    float fontSize = 12.0;                             // font size
    NSString *cellText = @"";        // change the text of the element
    
    // -----------------------------------------------------------
    
    NSDate *fullDate = currentDay.date;                             // get the name for that day
    NSDateFormatter *tempDF = [[NSDateFormatter alloc] init];       // initialize date formatter
    tempDF.dateFormat = @"MMM\ndd";                                  // get month from date
    cellText = [[tempDF stringFromDate:fullDate] uppercaseString];   // uppercase
    
    
    
    NSMutableParagraphStyle *cellParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    UIFont *cellFont = [UIFont fontWithName:fontName size:fontSize];        // element font
    cellParagraph.alignment = NSTextAlignmentCenter;                        // element paragraph settings
    NSDictionary *cellAttrDict = @{NSFontAttributeName:cellFont, NSParagraphStyleAttributeName:cellParagraph}; // element attributes
    
    
    // create the rectangle
    float cellX = self.attendanceStartingX + (index * (cellWidth + self.generalXmargin));
    float cellY = self.attendanceStartingY - (cellHeight + (self.generalYmargin *2));
    CGRect cellRect = CGRectMake(cellX, cellY, cellWidth, cellHeight);
    
    
    // add it to the page
    [cellText drawInRect:cellRect withAttributes:cellAttrDict];
    
}

#pragma mark - Add day record cell
-(void)addCellForDay:(ClassDay*)day andStudent:(Student*)aStudent withDayIndex:(NSInteger)dayIndex andStudentIndex:(NSInteger)studentIndex
{
    
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight;          // cell height
    float cellWidth = self.generalTightColumnWidth;    // cell width
    NSString *fontName = @"Avenir";                    // font name
    float fontSize = 12.0;                             // font size
    NSString *cellText = @"";        // change the text of the element
    
    // -----------------------------------------------------------
    
    
    NSMutableParagraphStyle *cellParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    UIFont *cellFont = [UIFont fontWithName:fontName size:fontSize];        // element font
    cellParagraph.alignment = NSTextAlignmentCenter;                        // element paragraph settings
    NSDictionary *cellAttrDict = @{NSFontAttributeName:cellFont, NSParagraphStyleAttributeName:cellParagraph}; // element attributes
    
    
    // look for the record belonging to that day
    AttendanceRecord *currentRecord = [aStudent getAttendanceRecordForDay:day];
    
    // if the record exists…
    if (currentRecord.status) {
        
        // attendance statuses array
        NSArray *statusArray = [NSArray arrayWithObjects:@"P", @"A", @"L", nil];
        
        // get the text
        cellText = [statusArray objectAtIndex:[currentRecord.status integerValue]];
        
    }
    
    // create the rectangle
    float cellX = self.attendanceStartingX + (dayIndex * (cellWidth + self.generalXmargin));
    float cellY = self.attendanceStartingY + (studentIndex * (cellHeight + self.generalYmargin));
    CGRect cellRect = CGRectMake(cellX, cellY, cellWidth, cellHeight);
    
    // add it to the page
    [cellText drawInRect:cellRect withAttributes:cellAttrDict];
    
}

#pragma mark - Add grade title
-(void)addCellForGradeTitle:(Evaluation*)evaluation atIndex:(NSInteger)index
{
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight*2;        // cell height
    float cellWidth = self.generalTightColumnWidth;    // cell width
    NSString *fontName = @"Avenir-Heavy";             // font name
    float fontSize = 12.0;                             // font size
    NSString *cellText = evaluation.nameShort;        // change the text of the element
    
    // -----------------------------------------------------------
    
    
    NSMutableParagraphStyle *cellParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    UIFont *cellFont = [UIFont fontWithName:fontName size:fontSize];        // element font
    cellParagraph.alignment = NSTextAlignmentCenter;                        // element paragraph settings
    NSDictionary *cellAttrDict = @{NSFontAttributeName:cellFont, NSParagraphStyleAttributeName:cellParagraph}; // element attributes
    
    
    // create the rectangle
    float cellX = self.gradesStartingX + (index * (cellWidth + self.generalXmargin));
    float cellY = self.gradesStartingY - (cellHeight + (self.generalYmargin *2));
    CGRect cellRect = CGRectMake(cellX, cellY, cellWidth, cellHeight);
    
    // add it to the page
    [cellText drawInRect:cellRect withAttributes:cellAttrDict];
    
    
}

#pragma mark - Add grade record cell
-(void)addCellForGrade:(Evaluation*)grade andStudent:(Student*)aStudent withGradeIndex:(NSInteger)gradeIndex andStudentIndex:(NSInteger)studentIndex
{
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight;          // cell height
    float cellWidth = self.generalTightColumnWidth;    // cell width
    NSString *fontName = @"Avenir";                    // font name
    float fontSize = 12.0;                             // font size
    NSString *cellText = @"";        // change the text of the element
    
    // -----------------------------------------------------------
    
    
    NSMutableParagraphStyle *cellParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    UIFont *cellFont = [UIFont fontWithName:fontName size:fontSize];        // element font
    cellParagraph.alignment = NSTextAlignmentCenter;                        // element paragraph settings
    NSDictionary *cellAttrDict = @{NSFontAttributeName:cellFont, NSParagraphStyleAttributeName:cellParagraph}; // element attributes
    
    
    // look for the record belonging to that day
    GradeRecord* currentRecord = [aStudent getGradeForEvaluation:grade];
    
    // if the record exists…
    if (currentRecord.grade) {
        // get the text
        cellText = [NSString stringWithFormat:@"%@", currentRecord.grade];
    }
    
    // create the rectangle
    float cellX = self.gradesStartingX + (gradeIndex * (cellWidth + self.generalXmargin));
    float cellY = self.gradesStartingY + (studentIndex * (cellHeight + self.generalYmargin));
    CGRect cellRect = CGRectMake(cellX, cellY, cellWidth, cellHeight);
    
    // add it to the page
    [cellText drawInRect:cellRect withAttributes:cellAttrDict];
    
}

#pragma mark - add row background
-(void)addRowBackgroundForIndex:(NSInteger)index
{
    // -----------------------------------------------------------
    // cell formatting -------------------------------------------
    // -----------------------------------------------------------
    
    float cellHeight = self.generalRowHeight;          // cell height
    float cellWidth = self.pageWidth - (self.pageMarginX * 2);    // cell width
    
    // -----------------------------------------------------------
    
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // create the rectangle
    float cellX = self.studentStartingX;
    float cellY = (self.studentStartingY + ((cellHeight + self.generalYmargin) * index) - 4);
    
    CGRect drawingRect = CGRectMake(cellX, cellY, cellWidth, cellHeight);
    [[UIColor colorWithWhite:0.9 alpha:1] set];
    
    CGContextFillRect( currentContext, drawingRect);

    
    
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
        
        // set starting X & Y for attendance
        self.attendanceStartingX = self.studentStartingX + 200 + (self.generalXmargin * 2);
        self.attendanceStartingY = self.studentStartingY;
        
        for (ClassDay *currentDay in self.daysArray) {
            
            // add the object
            [self addCellForDayTitle:currentDay atIndex:dayIndex];
            
            // move the day counter
            dayIndex++;
            
        }
        
        // get looping for grades headers… ---------------
        
        // set starting grades X & Y
        self.gradesStartingX = self.attendanceStartingX + ((self.generalTightColumnWidth + self.generalXmargin) * [aClass.classDays count]) + (self.generalXmargin * 4);
        self.gradesStartingY = self.studentStartingY;
        
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
            
            // set the row background
            if (!(rowIndex % 2)){
                [self addRowBackgroundForIndex:rowIndex];
            }
            
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
