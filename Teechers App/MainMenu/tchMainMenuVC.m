//
//  tchMainMenuVC.m
//  Teechers App
//
//  Created by fran on 4/20/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchMainMenuVC.h"
#import "tchImport1VC.h"

@interface tchMainMenuVC ()

@end

@implementation tchMainMenuVC

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
    if ([[segue identifier]isEqualToString:@"toAddAClass"]) {
        
        tchImport1VC *destinationVC = [segue destinationViewController];
        destinationVC.managedObjectContext = self.managedObjectContext;
        
    }
    
    
}

// unwind to main menu function
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}


@end
