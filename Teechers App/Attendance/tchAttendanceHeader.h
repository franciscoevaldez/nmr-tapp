//
//  tchAttendanceHeader.h
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"

@protocol tchHeaderDelegate <NSObject>

- (void)headerWasTapped;

@end

@interface tchAttendanceHeader : UIView

@property (nonatomic, weak) id <tchHeaderDelegate> delegate;
@property (strong,nonatomic) AClass *activeClass;
- (void)setupHeaderForClass:(AClass*)classForHeader;

- (void)swipeDoneLeft;
- (void)swipeDoneRight;
- (void)performDayScrollToIndex:(NSInteger)newIndex;

- (void)menuWasToggled;

@end
