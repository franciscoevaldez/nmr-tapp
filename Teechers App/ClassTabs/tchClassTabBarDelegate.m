//
//  tchClassTabBarDelegate.m
//  Teechers App
//
//  Created by fran on 18/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassTabBarDelegate.h"
#import "tchListViewController.h"

@implementation tchClassTabBarDelegate

-(BOOL)tabBarController:(nonnull UITabBarController *)tabBarController shouldSelectViewController:(nonnull UIViewController *)viewController
{
    
    // get the current view controller
    UIViewController *currentVC = tabBarController.selectedViewController;
    
    if (![currentVC isKindOfClass:[tchListViewController class]]) {
        return YES;
    }
    
    tchListViewController *activeVC = (tchListViewController*) currentVC;
    
    
    
    if (![viewController isKindOfClass:[tchListViewController class]]) {
        return YES;
    }
    
    tchListViewController *nextVC = (tchListViewController*) viewController;
    
    
    // get the scroll position for the current view controller
    CGPoint scrollPosition = activeVC.studentsTable.contentOffset;
    
    // pass the scroll position to the new view controller
    nextVC.initialScrollOffset = scrollPosition;
    
    // tell the new view controller of the scroll position
    nextVC.studentsTable.contentOffset = scrollPosition;
    
    return YES;
    
}

@end
