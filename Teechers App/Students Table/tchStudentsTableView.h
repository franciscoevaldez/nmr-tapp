//
//  tchStudentsTableView.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AClass+tchAClassExt.h"

@interface tchStudentsTableView : UITableView
//@interface tchStudentsTableView : UITableView <tchStudentCellProtocol>

- (void)setupForClass:(AClass*)activeClass;
- (void)reloadAllData;
- (void)performDayScrollToIndex:(NSInteger)newIndex;

@property (nonatomic) NSIndexPath* deployedPath;
@property (nonatomic) BOOL thereIsACellDeployed;

@property (nonatomic) NSInteger deployedCellHeight;

@end
