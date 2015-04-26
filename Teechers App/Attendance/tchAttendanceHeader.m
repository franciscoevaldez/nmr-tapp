//
//  tchAttendanceHeader.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceHeader.h"
#import "tchAttHeaderDaysCDS.h"

@interface tchAttendanceHeader ()

@property (strong,nonatomic) IBOutlet UILabel *classNameLabel;
@property (strong,nonatomic) IBOutlet tchAttHeaderDaysCDS * tchHeaderDaysDataSource;

@end

@implementation tchAttendanceHeader


- (void)setupHeaderForClass:(AClass*)classForHeader{
    
    // call collection view controller to get ready
    [self.tchHeaderDaysDataSource setupForClass:classForHeader];
    
    // pass class object from method to header object
    self.activeClass = classForHeader;
    
    // write class name in label
    self.classNameLabel.text = classForHeader.name;
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
