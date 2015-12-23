//
//  tchColumnCollectionDelegate.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnCollectionDelegate.h"
#import "tchHeaderColumnCollection.h"
#import "UIColor+appColorPresets.h"

@implementation tchColumnCollectionDelegate

-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    
    if (indexPath.section == 1) {
        
        // get phone width
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenBound.size.width;
        
        return CGSizeMake((screenWidth-20), 60);
    }
    
    return CGSizeMake(60, 60);
    
}

-(void)collectionView:(tchHeaderColumnCollection *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        
    // get the index to be scrolled to
    NSInteger newIndex = indexPath.row;
    
    // tell the collection a column was selected
    [collectionView columnWasSelected:newIndex];
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor tchBlueMedium];
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor tchBlueDeep];
    
}

@end
