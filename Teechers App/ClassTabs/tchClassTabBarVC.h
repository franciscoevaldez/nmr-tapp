//
//  tchClassTabBarVC.h
//  Teechers App
//
//  Created by fran on 4/22/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"

@interface tchClassTabBarVC : UITabBarController

@property (strong,nonatomic) AClass *activeClass;

@end
