//
//  tchHeaderColumnCollDataSource.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "tchHeaderColumnCollection.h"

#import "AClass.h"

@protocol tchHeaderColumnsDataSource <UICollectionViewDataSource>
- (void)setupForClass:(AClass*)activeClass;
@end

@interface tchHeaderColumnCollDataSource : NSObject <UICollectionViewDataSource>

- (void)setupForClass:(AClass*)activeClass;

@end
