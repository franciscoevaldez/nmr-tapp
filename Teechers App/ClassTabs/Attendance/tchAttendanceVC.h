//
//  tchAttendanceVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchListViewController.h"

#import "AClass+tchAClassExt.h"

#import "tchHeaderView.h"
#import "tchEditDayVC.h"
#import "tchAttendanceMenu.h"

@interface tchAttendanceVC : tchListViewController <tchHeaderDelegate, tchEditDayVCDelegate, tchDropMenuDelegate>

@property (nonatomic) BOOL takeAttendanceMode;

@end
