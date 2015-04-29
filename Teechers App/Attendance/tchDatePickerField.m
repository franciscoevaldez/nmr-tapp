//
//  tchDatePickerField.m
//  Teechers App
//
//  Created by fran on 29/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchDatePickerField.h"

@interface tchDatePickerField()

@property (strong,nonatomic) UIDatePicker *inputDayPicker;

@end

@implementation tchDatePickerField


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // Custom Implementation
        
        // create a Datepicker
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        
        // set picker to today only
        datePicker.datePickerMode = UIDatePickerModeDate;
        
        // set the minimum date (2015)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSCalendar *calendar = [[NSCalendar alloc]  initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        [comps setDay:1];
        [comps setMonth:1];
        [comps setYear:2015];
        NSDate *minDate = [calendar dateFromComponents:comps];
        datePicker.minimumDate = minDate;
        
        // set maximum date (2017)
        [comps setDay:31];
        [comps setMonth:12];
        [comps setYear:2016];
        NSDate *maxDate = [calendar dateFromComponents:comps];
        datePicker.maximumDate = maxDate;
        
        // set new picker to object property
        self.inputDayPicker = datePicker;
        
        // register selector for picking up events
        [self.inputDayPicker addTarget:self action:@selector(datePickerChanged) forControlEvents:UIControlEventValueChanged];

        // link the text field with the date picker
        [self setInputView:datePicker];
        
        // set day picker date to today
        datePicker.date = [NSDate date];
        // setup the formatter
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd yyyy"];
        
        // get the nsstring for that date
        NSString *dateAsText = [formatter stringFromDate:[NSDate date]];
        
        // write the date in the label
        self.text = dateAsText;

        
    }
    return self;
}


// method for handling date picker change
- (void)datePickerChanged{
    
    // pass picked date to accesible property
    self.pickedDate =  self.inputDayPicker.date;
    
    // display the picked date as text
    // setup the formatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd yyyy"];
    
    // get the nsstring for that date
    NSString *dateAsText = [formatter stringFromDate:self.inputDayPicker.date];
    
    // write the date in the label
    self.text = dateAsText;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
