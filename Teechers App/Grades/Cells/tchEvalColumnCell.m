//
//  tchEvalColumnCell.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEvalColumnCell.h"
#import "UIColor+appColorPresets.h"

@interface tchEvalColumnCell ()

@property (strong,nonatomic) GradeRecord *currentRecord;
@property (strong,nonatomic) Evaluation *currentEvaluation;

@end


@implementation tchEvalColumnCell

// setup the cell for the given record
- (void) setupForRecord:(GradeRecord*)record orEvaluation:(Evaluation*)evaluation
{
    
    // pass the given record to the property
    self.currentRecord = record;
    
    // and the given day
    self.currentEvaluation = evaluation;
    
    // initialize cell label
    NSString *labelText = @"-";
    self.dataLabel.textColor = [UIColor tchTextColor];
    
    // if the record exists…
    if (record.grade) {
        
        // get the text for the label
        labelText = [NSString stringWithFormat:@"%@", record.grade];
        
        /*
        // it the record is not approved (later)
        if ([record.status isEqual: tchAttendanceRecAbsent]
            && ([record.excused intValue] == tchAttendanceRecExcusedNO)) {
            
            // set the label color to red
            self.dataLabel.textColor = [UIColor tchRed];
            
        }
         */
        
    }
    
    // write on the label
    self.dataLabel.text = labelText;
    
}

@end
