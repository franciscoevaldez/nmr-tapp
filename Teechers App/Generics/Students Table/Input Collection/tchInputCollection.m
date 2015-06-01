//
//  tchInputCollection.m
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchInputCollection.h"
#import "tchGradeInputDataSource.h"

@implementation tchInputCollection

-(void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex{
    
    // pass the student to the property
    self.activeStudent = student;
    
    // pass the column to the property
    self.activeColumn = &(columnIndex);
    
    if (self.dataSource) {
        
        // cast the data source into known class
        tchGradeInputDataSource *myDataSource = self.dataSource;
        
        // tell the data source to setup itself
        [myDataSource setupForStudent:student columnIndex:columnIndex];
        
    }
    
};

- (void)itemWasSelected:(NSIndexPath*)indexPath{
    
    // tell the collection delegate to scroll
    [_inputDelegate inputWasSelected:indexPath];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
