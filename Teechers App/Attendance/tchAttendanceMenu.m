//
//  tchAttendanceMenu.m
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceMenu.h"
#import "tchAttDayBandColDS.h"

@interface tchAttendanceMenu ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) IBOutlet tchAttDayBandColDS *tchDayBandDataSource;
@property (strong, nonatomic) IBOutlet UICollectionView *dayBandCollection;

@end

@implementation tchAttendanceMenu

-(void)setupMenu{
    
    self.deployed = FALSE;
    self.heightConstraint.constant = 0.0f;
    
}

-(void)toggleMenu{
    
    self.deployed = !self.deployed;
    
}

// setup the menu for the class coming from the view controller
-(void)setupForClass:(AClass *)activeClass{

    // set the day band data source
    [self.tchDayBandDataSource setupForClass:activeClass];
    
}

#pragma mark - react to data reload
- (void)reloadData{
    
    [self.dayBandCollection reloadData];
    [self.dayBandCollection reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
