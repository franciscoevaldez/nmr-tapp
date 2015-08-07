//
//  tchViewKeyboardVC.h
//  Teechers App
//
//  Created by fran on 7/26/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchManagedViewController.h"

@interface tchViewKeyboardVC : tchManagedViewController

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

- (void)registerForKeyboardNotifications;
- (void)keyboardWasShown:(NSNotification*)aNotification;
- (void)keyboardWillBeHidden:(NSNotification*)aNotification;

@end
