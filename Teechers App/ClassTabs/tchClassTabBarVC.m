//
//  tchClassTabBarVC.m
//  Teechers App
//
//  Created by fran on 4/22/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchClassTabBarVC.h"

@interface tchClassTabBarVC ()

@end

@implementation tchClassTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    
    // Image setup for different tabs
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setImage:[UIImage imageNamed:@"Students - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setSelectedImage:[UIImage imageNamed:@"Students - Sel"]];
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setImage:[UIImage imageNamed:@"Attendance - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setSelectedImage:[UIImage imageNamed:@"Attendance - Sel"]];
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setImage:[UIImage imageNamed:@"Evaluations - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setSelectedImage:[UIImage imageNamed:@"Evaluations - Sel"]];
    
    // font & icon color
    UIColor *highlightColor = [UIColor colorWithRed:60.0/255 green:160.0/255 blue:203.0/255 alpha:1.0];
    
    // font styles
    /*[UITabBarItem.appearance setTitleTextAttributes: @{
                                                       NSForegroundColorAttributeName: [UIColor colorWithRed:214.0/255
                                                                                                       green:69.0/255
                                                                                                        blue:65.0/255
                                                                                                       alpha:1.0],
                                                       NSFontAttributeName : [UIFont fontWithName:@"Avenir" size:10.0f]
                                                       } forState:UIControlStateNormal];*/
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIFont fontWithName:@"Avenir-Heavy" size:10.0f], NSFontAttributeName,
                                                       nil]
                                             forState:UIControlStateNormal];
    
    [[UITabBar appearance] setTintColor:highlightColor];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
