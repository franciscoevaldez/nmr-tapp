//
//  tchInputView.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchInputView.h"

#import "tchInputCollection.h"

@interface tchInputView()

@end

@implementation tchInputView

-(void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex{
    
    // pass given data to properties
    self.activeStudent = student;
    self.activeColumn = &(columnIndex);
    
    // if there is an input collection
    if (self.inputCollection) {
        
        // cast the input collection
        tchInputCollection *inputCollection = (tchInputCollection*) self.inputCollection;
        
        // tell the data collection to setup itself
        [inputCollection setupForStudent:student andColumn:columnIndex];
        
        
    }

};

-(void)setupDelegate:(id)delegate{};

-(void)updateActiveColumn:(NSInteger)columnIndex{};

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
