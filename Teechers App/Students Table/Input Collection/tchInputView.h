//
//  tchInputView.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Student+tchStudentsExt.h"

@protocol tchInputViewProtocol <NSObject>

-(void)inputShouldDismiss;

@required
- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end




@interface tchInputView : UIView

@property (nonatomic, weak) id <tchInputViewProtocol> delegate;
- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end
