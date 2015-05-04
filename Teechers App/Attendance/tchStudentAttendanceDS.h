//
//  tchStudentAttendanceDS.h
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AClass+tchAClassExt.h"
#import "Student+tchStudentsExt.h"


@interface tchStudentAttendanceDS : NSObject <UICollectionViewDataSource>

- (void)setupForStudent:(Student*)activeStudent;

@property (strong,nonatomic) Student *activeStudent;

@end
