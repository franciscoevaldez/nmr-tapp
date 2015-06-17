//
//  tchStudentSummaryDataCell.m
//  Teechers App
//
//  Created by fran on 7/6/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentSummaryDataCell.h"

#import "ClassDay+tchClassDayExt.h"
#import "AttendanceRecord+tchAttExt.h"
#import "Evaluation+tchEvalExt.h"
#import "GradeRecord.h"
#import "StudentSummary.h"


@interface tchStudentSummaryDataCell ()

@property (strong,nonatomic) IBOutlet UILabel *mainLabel;
@property (strong,nonatomic) IBOutlet UILabel *secondaryLabel;
@property (strong,nonatomic) IBOutlet UILabel *terciaryLabel;

@end

@implementation tchStudentSummaryDataCell

-(void)setupCellForData:(id)dataElement atIndexPath:(NSIndexPath*)indexPath{
    
    if (indexPath.row == 0) {
        
        // cast the recieved data
        StudentSummary *record = dataElement;
        
        // if section is attendance
        if (indexPath.section == 0) {
            
            // main label data
            self.mainLabel.text = @"Attendance";
            
            // secondaty label data
            NSString *secondaryText = [NSString stringWithFormat:@"%i%li",
                                       [record.attTotal integerValue] - [record.attAbsents integerValue],
                                       (long)[record.attTotal integerValue]];
            
            self.secondaryLabel.text = secondaryText;
            
            // terciary label data
            float pct = record.attPercentage.floatValue*100;
            NSString *terciaryText = [NSString stringWithFormat:@"%.01f%%", pct];
            self.terciaryLabel.text = terciaryText;
            
            
        }
        
        // if section is grades
        if (indexPath.section == 1) {
            
            // main label data
            self.mainLabel.text = @"Grades";
            
            // secondaty label data
            float pct = record.grdPercentage.floatValue*100;
            NSString *secondaryText = [NSString stringWithFormat:@"%.01f%%", pct];
            self.secondaryLabel.text = secondaryText;
            
            // terciary label data
            self.terciaryLabel.text = @"";
            
            
            
        }
        
    }
    
    if ([dataElement isKindOfClass:[AttendanceRecord class]]) {
        
        AttendanceRecord *record = dataElement;
        
        // get the main label data
        NSString *mainText;
        NSDate *fullDate = record.classDay.date;
        
        NSDateFormatter *tempDF = [[NSDateFormatter alloc] init];
        tempDF.dateFormat = @"LLL dd";
        NSString *dateLabelText = [[tempDF stringFromDate:fullDate] uppercaseString];
        
        if (![record.classDay.name isEqual: @""]) {
            mainText = record.classDay.name;
        } else {
            mainText = [NSString stringWithFormat:@"Class of %@", dateLabelText];
        }
        
        self.mainLabel.text = mainText;
        
        // get the date to the secondary data
        NSString *secondaryText = @"P";
        
        if ([record.status integerValue] == tchAttendanceAbsent) {
            secondaryText = @"A";
        }
        
        if ([record.status integerValue] == tchAttendanceLate) {
            secondaryText = @"L";
        }
        
        self.secondaryLabel.text = secondaryText;
        
        
        // get the name of the day to the third column
        NSString *thirdText = @"";
        
        if ([record.excused integerValue] == tchAttendanceExcusedYes) {
            thirdText = @"Excused";
        }
        
        self.terciaryLabel.text = thirdText;
        
    }
    
    if ([dataElement isKindOfClass:[GradeRecord class]]) {
        
        GradeRecord *record = dataElement;
        
        // get the main label data
        NSString *mainLabelText = record.forClass.name;
        self.mainLabel.text = mainLabelText;
        
        // get the date to the secondary data
        NSString *secondaryText = [NSString stringWithFormat:@"%@", record.grade];
        self.secondaryLabel.text = secondaryText;
        
        // get the name of the day to the third column
        float pct = record.percentage.floatValue*100;
        NSString *terciaryText = [NSString stringWithFormat:@"%.01f%%", pct];
        self.terciaryLabel.text = terciaryText;
        
    }
    
}

@end
