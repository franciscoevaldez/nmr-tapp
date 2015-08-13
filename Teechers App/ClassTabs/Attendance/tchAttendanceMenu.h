//
//  tchAttendanceMenu.h
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchDropMenuView.h"

@interface tchAttendanceMenu : tchDropMenuView

@property (strong,nonatomic) IBOutlet UIButton *btnAddDay;
@property (strong,nonatomic) IBOutlet UIButton *btnAttendance;
@property (strong,nonatomic) IBOutlet UIButton *btnRemove;
@property (strong,nonatomic) IBOutlet UIButton *btnEdit;


@end
