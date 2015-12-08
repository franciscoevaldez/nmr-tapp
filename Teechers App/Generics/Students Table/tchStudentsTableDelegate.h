//
//  tchStudentsTableDelegate.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "tchStudentsTableView.h"

@interface tchStudentsTableDelegate : NSObject <UITableViewDelegate, UIScrollViewDelegate>

- (void)clearSelectionForTableView:(tchStudentsTableView*)tableView;
- (void)reloadSelectedCellInTableView:(tchStudentsTableView*)tableView;

@end
