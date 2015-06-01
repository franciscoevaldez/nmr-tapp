//
//  tchAttendanceColumnsDS.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchColumnCollectionDataSource.h"

#import "Student+tchStudentsExt.h"

@interface tchAttendanceColumnsDS : tchColumnCollectionDataSource <tchColumnCollectionDSProtocol>

- (void)setupForStudent:(Student*)activeStudent;

@end
