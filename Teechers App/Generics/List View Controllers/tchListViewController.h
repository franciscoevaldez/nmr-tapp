//
//  tchListViewController.h
//  Teechers App
//
//  Created by fran on 31/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AClass+tchAClassExt.h"

#import "tchStudentsTableView.h"
#import "tchDropMenuView.h"
#import "tchHeaderView.h"

@interface tchListViewController : UIViewController <tchHeaderDelegate>

@property (strong,nonatomic) AClass *activeClass;

@property (strong,nonatomic) IBOutlet tchHeaderView *headerView;
@property (strong,nonatomic) IBOutlet tchDropMenuView *optionsMenu;
@property (strong,nonatomic) IBOutlet tchStudentsTableView *studentsTable;

@property (assign, nonatomic) NSInteger currentColumnIndex;
@property (nonatomic) CGPoint initialScrollOffset;

@property (nonatomic) BOOL editionEnabled;


-(void)setupForClass:(AClass*)activeClass;
- (void)reloadViewsData;

-(void)checkEditionEnable;

-(void)headerWasTapped;
-(void)optionsMenuDeploy;
-(void)optionsMenuClose;
-(void)snapMenuClosed;

-(void)performInitialScroll;

-(NSInteger)getMaxScroll;
-(IBAction)swipeLeftDone:(id)sender;
-(IBAction)swipeRightDone:(id)sender;
-(void)scrollToIndex:(NSInteger)newIndex;

@end
