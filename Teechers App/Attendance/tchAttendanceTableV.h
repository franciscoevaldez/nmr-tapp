//
//  tchAttendanceTableV.h
//  Teechers App
//
//  Created by fran on 2/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass+tchAClassExt.h"
#import "tchStudentDataTVC.h"

@interface tchAttendanceTableV : UITableView <tchStudentCellProtocol>

- (void) performDayScrollToIndex:(NSInteger)newIndex;
- (void) setupForClass:(AClass*)activeClass;
- (void) fullReload;

@property (nonatomic) NSIndexPath* selectedPath;
@property (nonatomic) BOOL thereIsSelection;

@end
