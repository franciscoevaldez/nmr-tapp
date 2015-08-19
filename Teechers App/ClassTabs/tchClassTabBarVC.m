//
//  tchClassTabBarVC.m
//  Teechers App
//
//  Created by fran on 4/22/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchClassTabBarVC.h"

#import "tchStudentsVC.h"
#import "tchAttendanceVC.h"
#import "tchGradesVC.h"
#import "tchClassOptionsVC.h"

@interface tchClassTabBarVC ()

@end

@implementation tchClassTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    
    
    // Distribuir la clase a los view controllers
    
    tchStudentsVC *studentsViewController = [self.viewControllers objectAtIndex:0];
    studentsViewController.activeClass = self.activeClass;
    
    tchAttendanceVC *attendanceViewController = [self.viewControllers objectAtIndex:1];
    attendanceViewController.activeClass = self.activeClass;
    
    tchGradesVC *gradesViewController = [self.viewControllers objectAtIndex:2];
    gradesViewController.activeClass = self.activeClass;
    
    tchClassOptionsVC *classOptionsViewController = [self.viewControllers objectAtIndex:3];
    classOptionsViewController.activeClass = self.activeClass;
    
    
    // Image setup for different tabs
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setImage:[UIImage imageNamed:@"Students - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:0] setSelectedImage:[UIImage imageNamed:@"Students - Sel"]];
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setImage:[UIImage imageNamed:@"Attendance - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:1] setSelectedImage:[UIImage imageNamed:@"Attendance - Sel"]];
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setImage:[UIImage imageNamed:@"Evaluations - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:2] setSelectedImage:[UIImage imageNamed:@"Evaluations - Sel"]];
    
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:3] setImage:[UIImage imageNamed:@"More - Rest"]];
    [(UITabBarItem*)[[[self tabBar] items] objectAtIndex:3] setSelectedImage:[UIImage imageNamed:@"More - Sel"]];
    
    // font & icon color
    UIColor *highlightColor = [UIColor colorWithRed:60.0/255 green:160.0/255 blue:203.0/255 alpha:1.0];
    
    // font styles
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Avenir-Heavy" size:10.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
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
