//
//  tchGradesVC.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesVC.h"

#import "tchStudentsTableView.h"
#import "tchGradesMenu.h"

@interface tchGradesVC ()

@property (strong,nonatomic) IBOutlet tchStudentsTableView *studentsTableView;
@property (strong,nonatomic) IBOutlet tchGradesHeader *headerView;
@property (strong,nonatomic) IBOutlet tchGradesMenu *dropMenu;

@end

@implementation tchGradesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Tell the students table to setup itself
    [self.studentsTableView setupForClass:self.activeClass];
    
    // Setup the header for this class
    [self.headerView setupHeaderForClass:self.activeClass];
    
    // Setup the menu for this class
    [self.dropMenu setupForClass:self.activeClass];
    
}

#pragma mark - Header tapped
- (void)headerWasTapped {
        
    if (!self.dropMenu.status) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropMenu.heightConstraint.constant = self.dropMenu.heightForFullDeploy;
            [self.view layoutIfNeeded];
        }];
        
    } else {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropMenu.heightConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
        
    }
    
    [self.dropMenu toggleMenu];
    [self.headerView menuWasToggled];
    
    
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
