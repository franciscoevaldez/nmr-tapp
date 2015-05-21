//
//  tchGradesMenu.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesMenu.h"

@implementation tchGradesMenu

// setup the menu for the class coming from the view controller
-(void)setupForClass:(AClass *)activeClass{
    
    // default variable init
    [self defaultInit];
    
    // heights
    self.heightForFullDeploy = 160;
    self.heightForSemiDeploy = 50;
    
}

-(IBAction)addGrade:(UIButton *)sender{
    
    NSLog(@"add a grade process");
    
}

-(IBAction)editGrade:(UIButton *)sender{
    
    NSLog(@"edit a grade process");
    
}

-(IBAction)deleteGrade:(UIButton *)sender{
    
    NSLog(@"delete a grade process");
    
}


-(void)reloadData{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
