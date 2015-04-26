//
//  tchAttendanceInputTVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface tchAttendanceInputTVC : UITableViewCell

@property (strong,nonatomic) Student *studentForCell;

- (void)setupCellForStudent:(Student*)student;

@end
