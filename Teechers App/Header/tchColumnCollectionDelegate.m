//
//  tchColumnCollectionDelegate.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnCollectionDelegate.h"

@implementation tchColumnCollectionDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // tell the view controller that columns should be scrolled
    
    // get the index to be scrolled to
    NSInteger newIndex = indexPath.row;
    
    // tell it to the view controller
    if ([_myDelegate respondsToSelector:@selector(scrollToIndex:)]) {
        [_myDelegate scrollToIndex:newIndex];
    }
    
    
}

@end
