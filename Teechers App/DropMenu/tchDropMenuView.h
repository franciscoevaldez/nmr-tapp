//
//  tchDropMenuView.h
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tchHeaderColumnCollection.h"
#import "tchStoreCoordinator.h"
#import "AClass+tchAClassExt.h"

#define tchMenuStatusHidden         0
#define tchMenuStatusSemiDeployed   1
#define tchMenuStatusDeployed       2

@protocol tchDropMenuProtocol <NSObject>

-(void)setupForClass:(AClass *)activeClass;
-(void)reloadData;

@end

@protocol tchDropMenuDelegate <NSObject>

-(void)showAlert:(UIAlertController*)alertController;
-(void)reloadViewsData;
- (void)scrollToIndex:(NSInteger)newIndex;

@end

@interface tchDropMenuView : UIView <tchColumnCollectionDelegate>


@property (assign,nonatomic) int status;
@property (nonatomic, weak) IBOutlet id <tchDropMenuDelegate> delegate;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) IBOutlet tchHeaderColumnCollection *columnBandCollection;
@property (strong, nonatomic) IBOutlet tchStoreCoordinator *storeCoordinator;

@property (assign,nonatomic) int heightForFullDeploy;
@property (assign,nonatomic) int heightForSemiDeploy;

-(void)defaultInit;
-(void)toggleMenu;


@end
