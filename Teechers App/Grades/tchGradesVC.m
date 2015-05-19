//
//  tchGradesVC.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesVC.h"

#import "tchStudentsTableView.h"
#import "tchGradesHeader.h"

@interface tchGradesVC ()

@property (strong,nonatomic) IBOutlet tchStudentsTableView *studentsTableView;
@property (strong,nonatomic) IBOutlet tchGradesHeader *headerView;

@end

@implementation tchGradesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Tell the students table to setup itself
    [self.studentsTableView setupForClass:self.activeClass];
    
    // Setup the header for this class
    [self.headerView setupHeaderForClass:self.activeClass];
    
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
