//
//  tchCollectionIndexed.h
//  Teechers App
//
//  Created by fran on 6/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student+tchStudentsExt.h"

@interface tchCollectionIndexed : UICollectionView

@property (nonatomic) NSInteger index;
@property (nonatomic) Student *student;
@property (assign,nonatomic) NSInteger activeColumn;

- (void)performColumnScrollToIndex:(NSInteger)newIndex;

@end
