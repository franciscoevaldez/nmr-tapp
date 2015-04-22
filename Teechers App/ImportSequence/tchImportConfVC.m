//
//  tchImportConfVC.m
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImportConfVC.h"
#import "tchMainMenuVC.h"

@interface tchImportConfVC ()

@end

@implementation tchImportConfVC

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
    if ([[segue identifier]isEqualToString:@"toMainMenu"]) {
        
        // pass managed object context to confirmation
        tchMainMenuVC *nextViewController = [segue destinationViewController];
        nextViewController.managedObjectContext = self.managedObjectContext;
        
        
    }
    
    
}


@end
