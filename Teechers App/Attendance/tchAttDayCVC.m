//
//  tchAttDayCVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttDayCVC.h"

@interface tchAttDayCVC ()
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;

@end

@implementation tchAttDayCVC

- (void)setupCellForDay:(ClassDay*)classDay{
    
    // set classday to self
    self.dayInCell = classDay;
    
    // get date from classDay
    NSDate *fullDate = classDay.date;
    
    // initialize date formatter
    NSDateFormatter *tempDF = [[NSDateFormatter alloc] init];
    
    // get month from date
    tempDF.dateFormat = @"MMM";
    NSString *labelMonthText = [[tempDF stringFromDate:fullDate] uppercaseString];
    
    // get day from date
    tempDF.dateFormat = @"dd";
    NSString *labelDayText = [[tempDF stringFromDate:fullDate] uppercaseString];
    
    // write month in label
    self.monthLabel.text = labelMonthText;
    
    // write day in label
    self.dayLabel.text = labelDayText;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected];
    
    // Configure the view for the selected state
    
    // Deselect in the end
    [super setSelected:NO];
    
}

@end
