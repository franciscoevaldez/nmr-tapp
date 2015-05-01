//
//  tchAttendanceVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass+tchAClassExt.h"

#import "tchAttendanceHeader.h"
#import "tchAttDayBandColDel.h"
#import "tchEditDayVC.h"
#import "tchAttendanceMenu.h"

@interface tchAttendanceVC : UIViewController <tchHeaderDelegate,tchDayBandDelegate, tchEditDayVCDelegate, tchMenuDelegate>

@property (strong,nonatomic) AClass *activeClass;

@end
