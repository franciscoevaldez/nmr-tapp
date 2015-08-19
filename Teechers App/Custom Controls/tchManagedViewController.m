//
//  tchManagedViewController.m
//  Teechers App
//
//  Created by fran on 8/3/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchManagedViewController.h"

@interface tchManagedViewController ()

@end

@implementation tchManagedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController *navController = [segue destinationViewController];
    
    if ([navController isKindOfClass:[tchManagedViewController class]]) {
        
        tchManagedViewController *mvc = (tchManagedViewController*) navController;
        
        if (self.managedObjectContext) {
            mvc.managedObjectContext = self.managedObjectContext;
        }
        
        if (self.activeClass) {
            mvc.activeClass = self.activeClass;
        }
        
    }
    
    
}


@end
