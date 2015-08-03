//
//  tchInputCollectionDelegate.m
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchInputCollectionDelegate.h"
#import "tchInputCollection.h"

@implementation tchInputCollectionDelegate

-(void)collectionView:(tchInputCollection *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    // tell the collection a column was selected
    [collectionView itemWasSelected:indexPath];
    
}

@end
