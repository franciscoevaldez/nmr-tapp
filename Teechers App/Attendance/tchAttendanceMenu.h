//
//  tchAttendanceMenu.h
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass+tchAClassExt.h"

@protocol tchMenuDelegate <NSObject>

- (void)showAlert:(UIAlertController*)alertController;
- (ClassDay*)getCurrentDay;
- (void)reloadViewsData;

@end

@interface tchAttendanceMenu : UIView

-(void)toggleMenu;
-(void)setupMenu;
-(void)setupForClass:(AClass *)activeClass;
- (void)reloadData;

@property (assign,nonatomic) BOOL deployed;
@property (nonatomic, weak) id <tchMenuDelegate> delegate;

@end
