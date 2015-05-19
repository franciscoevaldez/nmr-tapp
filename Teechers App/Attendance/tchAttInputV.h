//
//  tchAttInputV.h
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tchInputView.h"


@interface tchAttInputV : tchInputView <tchInputViewProtocol>

- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@property(nonatomic,assign) id<tchInputDelegateProtocol>   myDelegate;

@end

/*
@interface tchAttInputV : UIView

@property (nonatomic, weak) id <tchInputProtocol> delegate;

- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end
*/