//
//  tchAttendanceColumnVC.m
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceColumnVC.h"
#import "UIColor+appColorPresets.h"

@interface tchAttendanceColumnVC()

@property (strong,nonatomic) ClassDay *currentDay;
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;

@end

@implementation tchAttendanceColumnVC

// setup the cell for the given record
- (void) setupForRecord:(AttendanceRecord*)record orDate:(ClassDay*)classDay
{
    
    // pass the given record to the property
    self.currentRecord = record;
    
    // and the given day
    self.currentDay = classDay;
    
    // initialize cell label
    NSString *labelText = @"-";
    self.dataLabel.textColor = [UIColor tchTextColor];
    
    // if the record exists…
    if (record.status) {
        
        // attendance statuses array
        NSArray *statusArray = [NSArray arrayWithObjects:@"P", @"A", @"L", nil];
        
        // get the text for the label
        labelText = [statusArray objectAtIndex:[record.status integerValue]];
        
        // it the record is absent
        if ([record.status integerValue] == tchAttendanceAbsent &&
            [record.excused integerValue] == tchAttendanceExcusedNo) {
            
            // set the label color to red
            self.dataLabel.textColor = [UIColor tchRed];
            
        }
        
    }
        
    // write on the label
    self.dataLabel.text = labelText;
    
}

- (void) tempSetup:(NSInteger)currentIndex
{
    
    // pass index to label
    self.dataLabel.text = [NSString stringWithFormat:@"%li", (long)currentIndex];
    
}


@end
