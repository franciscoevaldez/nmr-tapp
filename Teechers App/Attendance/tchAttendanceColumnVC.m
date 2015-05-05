//
//  tchAttendanceColumnVC.m
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceColumnVC.h"

@interface tchAttendanceColumnVC()

@property (strong,nonatomic) ClassDay *currentDay;
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;

@end

@implementation tchAttendanceColumnVC

# pragma mark - Cell Setup
// setup the cell for the given record
- (void) setupForRecord:(AttendanceRecord*)record orDate:(ClassDay*)classDay
{
    
    // pass the given record to the property
    self.currentRecord = record;
    
    // and the given day
    self.currentDay = classDay;
    
    // initialize cell label
    NSString *labelText = @"-";
    
    // if the record exists…
    if (record) {
        
        // get the text for the label
        labelText = record.status;
        
    }
    
    // write on the label
    self.dataLabel.text = labelText;
    
}

# pragma mark - Temporary setup (for testing only)
- (void) tempSetup:(NSInteger)currentIndex
{
    
    // pass index to label
    self.dataLabel.text = [NSString stringWithFormat:@"%i", currentIndex];
    
}


@end
