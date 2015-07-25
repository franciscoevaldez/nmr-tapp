//
//  tchEditDayFormTableDS.h
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "tchEditDayFormTable.h"
#import "ClassDay+tchClassDayExt.h"

@interface tchEditDayFormTableDS : NSObject <UITableViewDataSource>

@property (strong,nonatomic) ClassDay *activeDay;

-(void)setupForClassDay:(ClassDay*)editableDay;

@end
