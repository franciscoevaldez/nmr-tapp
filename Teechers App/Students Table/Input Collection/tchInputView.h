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

@required
- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)setupDelegate:(id)delegate;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end


@protocol tchInputDelegateProtocol <NSObject>

-(void)cellShouldDismiss;

@end



@interface tchInputView : UIView

@property (nonatomic, weak) id <tchInputDelegateProtocol> delegate;

- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)setupDelegate:(id)delegate;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end
