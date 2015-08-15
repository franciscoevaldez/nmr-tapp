//
//  tchStudentSummaryTable.h
//  Teechers App
//
//  Created by fran on 7/6/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "Student.h"

@interface tchStudentSummaryTable : UITableView

@property (strong,nonatomic) Student *activeStudent;
- (void)setupForStudent:(Student*)student;

@end
