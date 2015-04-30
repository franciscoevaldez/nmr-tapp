//
//  tchAttendanceMenu.h
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass+tchAClassExt.h"

@interface tchAttendanceMenu : UIView

-(void)toggleMenu;
-(void)setupMenu;
@property (assign,nonatomic) BOOL deployed;

-(void)setupForClass:(AClass *)activeClass;
- (void)reloadData;

@end
