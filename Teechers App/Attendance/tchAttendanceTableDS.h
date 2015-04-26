//
//  tchAttendanceTableDS.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AClass.h"

@interface tchAttendanceTableDS : NSObject <UITableViewDataSource>

@property (strong,nonatomic) AClass *activeClass;

- (void)setupForClass:(AClass*)activeClass;

@end
