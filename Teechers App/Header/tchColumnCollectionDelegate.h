//
//  tchColumnCollectionDelegate.h
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol tchColumnCollectionDelegate <NSObject>

- (void)scrollToIndex:(NSInteger)newIndex;

@end




@interface tchColumnCollectionDelegate : NSObject <UICollectionViewDelegate>

@property (nonatomic, weak) id <tchColumnCollectionDelegate> myDelegate;

@end
