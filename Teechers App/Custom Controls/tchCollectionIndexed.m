//
//  tchCollectionIndexed.m
//  Teechers App
//
//  Created by fran on 6/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchCollectionIndexed.h"

@implementation tchCollectionIndexed

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
