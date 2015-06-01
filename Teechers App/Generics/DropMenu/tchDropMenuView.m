//
//  tchDropMenuView.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchDropMenuView.h"

@implementation tchDropMenuView

-(void)setupForClass:(AClass *)activeClass{
}

#pragma mark - Basic init
-(void)defaultInit{
    
    self.status = tchMenuStatusHidden;
    self.heightConstraint.constant = 0.0f;
    
}

#pragma mark - Data Handling
-(void)reloadData{}

#pragma mark - Toggle menu
-(void)toggleMenu{
    
    if (self.status) {
        self.status = tchMenuStatusHidden;
    } else {
        self.status = tchMenuStatusDeployed;
    };
    
}

#pragma mark - Column in coleccion selected
-(void)scrollToIndex:(NSInteger)newIndex{
    
    // tell delegate to scroll columns
    [self.delegate scrollToIndex:newIndex];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
