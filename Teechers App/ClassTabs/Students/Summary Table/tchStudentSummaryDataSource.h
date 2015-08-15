//
//  tchStudentSummaryDataSource.h
//  Teechers App
//
//  Created by fran on 7/6/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Student.h"

@interface tchStudentSummaryDataSource : NSObject <UITableViewDataSource>

@property (strong,nonatomic) Student *activeStudent;
- (void)setupForStudent:(Student*)student;

@end
