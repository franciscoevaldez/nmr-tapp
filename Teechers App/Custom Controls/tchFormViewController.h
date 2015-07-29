//
//  tchFormViewController.h
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchFormViewController : UIViewController

@property (retain,nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

- (void)registerForKeyboardNotifications;

@end
