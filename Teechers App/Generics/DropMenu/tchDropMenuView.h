//
//  tchDropMenuView.h
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tchHeaderColumnCollection.h"
#import "AClass+tchAClassExt.h"

typedef NS_ENUM(NSInteger, tchMenuStatus) {
    tchMenuIsHidden,
    tchMenuIsSemiDeployed,
    tchMenuIsDeployed
};

@protocol tchDropMenuProtocol <NSObject>

-(void)setupForClass:(AClass *)activeClass;
-(void)reloadData;

@end

@protocol tchDropMenuDelegate <NSObject>

-(void)showAlert:(UIAlertController*)alertController;
-(id)getCurrentColumnItem;
-(void)reloadViewsData;
- (void)scrollToIndex:(NSInteger)newIndex;

@optional
- (void)toggleContinuousMode;

@end

@interface tchDropMenuView : UIView <tchColumnCollectionDelegate>


@property (assign,nonatomic) tchMenuStatus status;
@property (nonatomic, weak) IBOutlet id <tchDropMenuDelegate> delegate;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) IBOutlet tchHeaderColumnCollection *columnBandCollection;

@property (assign,nonatomic) int heightForFullDeploy;
@property (assign,nonatomic) int heightForSemiDeploy;

-(void)setupForClass:(AClass *)activeClass;
-(void)reloadData;
-(void)defaultInit;
-(void)toggleMenu;


@end
