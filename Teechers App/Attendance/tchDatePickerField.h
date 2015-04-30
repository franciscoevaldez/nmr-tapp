//
//  tchDatePickerField.h
//  Teechers App
//
//  Created by fran on 29/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchDatePickerField : UITextField

- (void)changeDatePicker:(NSDate*)newDate;
@property (strong,nonatomic) NSDate *pickedDate;

@end
