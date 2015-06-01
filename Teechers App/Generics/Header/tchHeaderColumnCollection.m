//
//  tchHeaderColumnCollection.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchHeaderColumnCollection.h"
#import "tchHeaderColumnCollDataSource.h"

@implementation tchHeaderColumnCollection

- (void)setupForClass:(AClass *)activeClass{
    
    // get the class for self
    self.activeClass = activeClass;
    
    // cast the data source
    tchHeaderColumnCollDataSource *dataSource = self.dataSource;
    
    // pass the class to the data source
    [dataSource setupForClass:activeClass];
    
}

- (void)columnWasSelected:(NSInteger)columnIndex{
    
    // tell the collection delegate to scroll
    [_columnDelegate scrollToIndex:columnIndex];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
