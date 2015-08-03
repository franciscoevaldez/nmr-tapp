//
//  tchColumnCollectionDelegate.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnCollectionDelegate.h"

#import "tchHeaderColumnCollection.h"

@implementation tchColumnCollectionDelegate

-(void)collectionView:(tchHeaderColumnCollection *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        
    // get the index to be scrolled to
    NSInteger newIndex = indexPath.row;
    
    // tell the collection a column was selected
    [collectionView columnWasSelected:newIndex];
    
}

@end
