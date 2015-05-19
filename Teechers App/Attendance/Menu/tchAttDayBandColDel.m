//
//  tchAttDayBandColDel.m
//  Day Band Collection Delegate
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttDayBandColDel.h"

@implementation tchAttDayBandColDel

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // tell the view controller that columns should be scrolled
    
    // get the index to be scrolled to
    NSInteger newIndex = indexPath.row;
    
    // tell it to the view controller
    if ([_delegate respondsToSelector:@selector(scrollToIndex:)]) {
        [_delegate scrollToIndex:newIndex];
    }
    
    
}

@end
