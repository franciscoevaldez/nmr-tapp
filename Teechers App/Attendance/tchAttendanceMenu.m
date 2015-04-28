//
//  tchAttendanceMenu.m
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceMenu.h"

@interface tchAttendanceMenu ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation tchAttendanceMenu

-(void)setupMenu{
    
    self.deployed = FALSE;
    self.heightConstraint.constant = 0.0f;
    
}

-(void)toggleMenu{
    
    if (self.deployed == FALSE) {
        
        //self.heightConstraint.constant = 180.0f;
        /*
        [UIView animateWithDuration:2 animations:^{
            self.heightConstraint.constant = 180;
            [self layoutIfNeeded];
        }];
         */
        
        self.deployed = !self.deployed;
        
    } else {
        
        /*
        [UIView animateWithDuration:2 animations:^{
            self.heightConstraint.constant = 0;
            [self layoutIfNeeded];
        }];
        */
        
        self.deployed = !self.deployed;
        
    }
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
