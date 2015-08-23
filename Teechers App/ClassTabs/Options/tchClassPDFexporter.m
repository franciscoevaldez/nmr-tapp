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

-(NSData*)generatePDFforClass:(AClass*)aClass
{
    
    
    // initialize the pdf data
    NSMutableData *pdfData = [NSMutableData data];
    
    // PDF metadata
    NSDictionary *pdfMetaData = [NSDictionary dictionaryWithObjectsAndKeys:@"Class Export", kCGPDFContextTitle, @"Teechers app", kCGPDFContextCreator, nil];

    // initialize the PDF CONTEXT
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, pdfMetaData);
    
    
    //CFRange currentRange = CFRangeMake(0, 0);
    NSInteger currentPage = 0;
    //BOOL done = NO;
    
    
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 842, 595), nil);
    
    
    // --------------------------------------------------------------------------------
    // General Settings
    // --------------------------------------------------------------------------------
    float generalRowHeight = 20.0;
    float generalTightColumnWidth = 30.0;
    float generalXmargin = 2.5;
    float generalYmargin = 2.5;
    
    float studentStartingX = 40.0;
    float studentStartingY = 120.0;
    
    
    // --------------------------------------------------------------------------------
    // Drawing a page
    // --------------------------------------------------------------------------------
    
    // Add page title -------------------------------------
    
    // element text
    NSString *pageTitle = aClass.name;
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
    
    
    // Add student list --------------------------------------------------------------------
    float studentHeight = generalRowHeight;
    float studentWidth = 200.0;
    
    // general  attributes & settings ---------------
    // element font
    UIFont *studentFont = [UIFont fontWithName:@"Avenir" size:12.0f];
    // element attributes
    NSDictionary *studentAttrDict = @{NSFontAttributeName:studentFont};
    // element sizing
    CGSize studentSize = CGSizeMake(studentWidth, generalRowHeight);
    
    // get looping for every student ---------------
    NSString *studentElement = nil;
    NSArray *studentArray = [aClass getStudentsSorted];
    NSInteger studentIndex = 0;
    
    
    for (Student *currentStudent in studentArray) {
        
        // change the text of the element
        studentElement = currentStudent.name;
        
        // create the rectangle
        float currentY = (studentStartingY + ((studentHeight + generalYmargin) * studentIndex));
        CGRect studentRect = CGRectMake(studentStartingX, currentY, studentSize.width, studentSize.height);
        
        // add it to the page
        [studentElement drawInRect:studentRect withAttributes:studentAttrDict];
        
        // move the counter
        studentIndex++;
        
        
    }
    
    
    // Add attendance record list --------------------------------------------------------------------
    
    // general  attributes & settings ---------------
    float attendanceWidth = generalTightColumnWidth;
    float attendanceHeight = generalRowHeight;
    float attendanceStartingX = studentStartingX + studentWidth + (generalXmargin * 2);
    
    // element font
    UIFont *attendanceFont = [UIFont fontWithName:@"Avenir" size:12.0f];
    // element paragraph settings
    NSMutableParagraphStyle *attendanceParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    attendanceParagraph.alignment = NSTextAlignmentCenter;
    // element attributes
    NSDictionary *attendanceAttrDict = @{NSFontAttributeName:attendanceFont, NSParagraphStyleAttributeName:attendanceParagraph};
    // element sizing
    CGSize attendanceSize = CGSizeMake(attendanceWidth, attendanceHeight);
    
    // get the day array
    NSArray *daysArray = [aClass getDaysSorted];
    NSInteger dayIndex = 0;
    
    // get looping for headers… ---------------
    NSString *dayText = nil;
    
    for (ClassDay *currentDay in daysArray) {
        
        // get the name for that day
        NSDate *fullDate = currentDay.date;
        // initialize date formatter
        NSDateFormatter *tempDF = [[NSDateFormatter alloc] init];
        // get month from date
        tempDF.dateFormat = @"MMM/dd";
        dayText = [[tempDF stringFromDate:fullDate] uppercaseString];
        
        // create the rectangle
        float targetX = attendanceStartingX + (dayIndex * (attendanceWidth + generalXmargin));
        float targetY = studentStartingY - (studentHeight + (generalYmargin *2));
        CGRect dayRect = CGRectMake(targetX, targetY, attendanceSize.width, attendanceSize.height);
        
        // add it to the page
        [dayText drawInRect:dayRect withAttributes:attendanceAttrDict];
        
        // move the day counter
        dayIndex++;
    }
    
    
    // get looping for student… ---------------
    NSString *attendanceText = nil;
    studentIndex = 0;
    
    for (Student *currentStudent in studentArray) {
        
        // …and get looping for each day ---------------
        dayIndex = 0;
        
        for (ClassDay *currentDay in daysArray) {
            
            // get the value for this student and day
            
            // reset text
            attendanceText = @"-";
            
            // look for the record belonging to that day
            AttendanceRecord* currentRecord = [currentStudent getAttendanceRecordForDay:currentDay];
            
            // if the record exists…
            if (currentRecord.status) {
                
                // attendance statuses array
                NSArray *statusArray = [NSArray arrayWithObjects:@"P", @"A", @"L", nil];
                
                // get the text
                attendanceText = [statusArray objectAtIndex:[currentRecord.status integerValue]];
                
            }
            
            // create the rectangle
            float targetX = attendanceStartingX + (dayIndex * (attendanceWidth + generalXmargin));
            float targetY = studentStartingY + (studentIndex * (studentHeight + generalYmargin));
            CGRect attendanceRect = CGRectMake(targetX, targetY, attendanceSize.width, attendanceSize.height);
            
            // add it to the page
            [attendanceText drawInRect:attendanceRect withAttributes:attendanceAttrDict];
            
            // move the day counter
            dayIndex++;
            
        }
        
        
        // move the counter
        studentIndex++;
        
        
    }
    
    
    // Add grades record list --------------------------------------------------------------------
    
    // general  attributes & settings ---------------
    float gradeWidth = generalTightColumnWidth;
    float gradeHeight = generalRowHeight;
    float gradeStartingX = studentStartingX + studentWidth + (attendanceWidth * [aClass.classDays count]) + (generalXmargin * 4);
    
    // element font
    UIFont *gradeFont = [UIFont fontWithName:@"Avenir" size:12.0f];
    // element paragraph settings
    NSMutableParagraphStyle *gradeParagraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    gradeParagraph.alignment = NSTextAlignmentCenter;
    // element attributes
    NSDictionary *gradeAttrDict = @{NSFontAttributeName:gradeFont, NSParagraphStyleAttributeName:gradeParagraph};
    // element sizing
    CGSize gradeSize = CGSizeMake(gradeWidth, gradeHeight);
    
    // get the evaluations array
    NSArray *gradesArray = [aClass getEvaluationsSorted];
    NSInteger gradeIndex = 0;
    
    
    // get looping for headers… ---------------
    NSString *evalText = nil;
    
    for (Evaluation *currentEval in gradesArray) {
        
        // get the name for that day
        evalText = currentEval.nameShort;
        
        // create the rectangle
        float targetX = gradeStartingX + (gradeIndex * (gradeWidth + generalXmargin));
        float targetY = studentStartingY - (studentHeight + (generalYmargin *2));
        CGRect gradeRect = CGRectMake(targetX, targetY, gradeSize.width, gradeSize.height);
        
        // add it to the page
        [evalText drawInRect:gradeRect withAttributes:gradeAttrDict];
        
        // move the day counter
        gradeIndex++;
    }
    
    
    
    // get looping for student… ---------------
    NSString *gradeText = nil;
    studentIndex = 0;
    
    for (Student *currentStudent in studentArray) {
        
        // …and get looping for each evaluation ---------------
        gradeIndex = 0;
        
        for (Evaluation *currentEval in gradesArray) {
            
            // get the value for this student and day
            
            // reset text
            gradeText = @"-";
            
            // look for the record belonging to that day
            GradeRecord* currentRecord = [currentStudent getGradeForEvaluation:currentEval];
            
            // if the record exists…
            if (currentRecord.grade) {
                // get the text
                gradeText = [NSString stringWithFormat:@"%@", currentRecord.grade];
            }
            
            // create the rectangle
            float targetX = gradeStartingX + (gradeIndex * (gradeWidth + generalXmargin));
            float targetY = studentStartingY + (studentIndex * (studentHeight + generalYmargin));
            CGRect gradeRect = CGRectMake(targetX, targetY, gradeSize.width, gradeSize.height);
            
            // add it to the page
            [gradeText drawInRect:gradeRect withAttributes:gradeAttrDict];
            
            // move the day counter
            gradeIndex++;
            
        }
        
        
        // move the counter
        studentIndex++;
        
        
    }
    
    
    // Adding page number -------------------------------------
    NSString *pageString = [NSString stringWithFormat:@"Page %d", currentPage+1];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    //CGSize maxSize = CGSizeMake(612, 72);

    CGSize pageStringSize = [pageString sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
    
    CGRect stringRect = CGRectMake(((842.0 - pageStringSize.width) / 2.0),
                                   595.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    
    [pageString drawInRect:stringRect withAttributes:@{NSFontAttributeName: theFont}];
    
   

    // --------------------------------------------------------------------------------
    // End of drawing a page
    // --------------------------------------------------------------------------------
    
    
    // Close the PDF CONTEXT and write the contents out.
    UIGraphicsEndPDFContext();
    
    return pdfData;
}

@end
