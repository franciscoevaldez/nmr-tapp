//
//  tchAttDayBandColDel.h
//  Day Band Collection Delegate
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol tchDayBandDelegate <NSObject>

- (void)scrollToIndex:(NSInteger)newIndex;

@end


@interface tchAttDayBandColDel : NSObject <UICollectionViewDelegate>

@property (nonatomic, weak) id <tchDayBandDelegate> delegate;

@end
