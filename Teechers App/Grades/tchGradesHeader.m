//
//  tchGradesHeader.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesHeader.h"

@implementation tchGradesHeader


#pragma mark - Header Setup
- (void)setupHeaderForClass:(AClass*)classForHeader{
    
    // if there is a column collection
    if (self.columnCollection) {
        
        // call the setup for it
        [self.columnCollection setupForClass:classForHeader];
        
    }
    
    // pass the class to the property
    self.activeClass = classForHeader;
    
    // write the class name in the title label
    self.subTitleLabel.text = classForHeader.name;
    
    // initialize variables
    [self defaultInit];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
