//
//  tchStudentsTableView.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"

@interface tchStudentsTableView : UITableView

- (void)setupForClass:(AClass*)activeClass;
- (void)reloadAllData;
- (void)performDayScrollToIndex:(NSInteger)newIndex;
- (void)enableTableNewStatus:(BOOL)newStatus;
- (void)triggerSelectAtIndexPath:(NSIndexPath*)indexPath;

@property (nonatomic) NSIndexPath* deployedPath;
@property (nonatomic) BOOL thereIsACellDeployed;

@property (nonatomic) NSInteger deployedCellHeight;
@property (nonatomic) NSInteger totalCells;

@property (nonatomic) BOOL continuousMode;
@property (nonatomic) BOOL isEnabled;

@end
