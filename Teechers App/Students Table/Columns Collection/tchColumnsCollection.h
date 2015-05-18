//
//  tchColumnsCollection.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "tchCollectionIndexed.h"

@interface tchColumnsCollection : tchCollectionIndexed

- (void)setupForStudent:(Student*)student;
- (void)performColumnScrollToIndex:(NSInteger)newIndex;

@property (assign,nonatomic) NSInteger activeColumn;

@end
