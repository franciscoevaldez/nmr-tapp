//
//  tchColumnsCollection.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnsCollection.h"
#import "tchColumnCollectionDataSource.h"

@interface tchColumnsCollection ()



@end

@implementation tchColumnsCollection

#pragma mark - Setting up for a student
- (void)setupForStudent:(Student*)student{
    
    // get the student to a property
    self.activeStudent = student;
    
    // cast the data source
    tchColumnCollectionDataSource *dataSource = self.dataSource;
    
    // pass the student to the data source
    [dataSource setupForStudent:student];
    
}

#pragma mark - Handling column scroll
- (void)performColumnScrollToIndex:(NSInteger)newIndex{
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeColumn = newIndex;
    
    // warn the input of the change
    //[self.inputView updateActiveColumn:newIndex];
    
}

@end
