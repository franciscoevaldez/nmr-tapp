//
//  tchHeaderView.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AClass+tchAClassExt.h"
#import "tchHeaderColumnCollection.h"


@protocol tchHeaderViewProtocol <NSObject>

- (void)setupHeaderForClass:(AClass*)classForHeader;

@end


@protocol tchHeaderDelegate <NSObject>

- (void)headerWasTapped;

@end


@interface tchHeaderView : UIView

@property(nonatomic,assign) id <tchHeaderDelegate> delegate;

- (void)setupHeaderForClass:(AClass*)classForHeader;
- (void)performColumnScrollToIndex:(NSInteger)newIndex;
- (void)menuWasToggled;
- (void)reloadData;

- (void)defaultInit;

@property (strong,nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong,nonatomic) IBOutlet UIImageView *deployIndicator;
@property (strong,nonatomic) IBOutlet tchHeaderColumnCollection *columnCollection;

@property (strong,nonatomic) AClass *activeClass;
@property (assign,nonatomic) NSInteger activeColumnIndex;
@property (assign,nonatomic) BOOL isHighlighted;

@end
