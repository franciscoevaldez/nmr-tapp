//
//  tchGradesVC.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesVC.h"

#import "tchStudentsTableView.h"

@interface tchGradesVC ()

@property (strong,nonatomic) IBOutlet tchStudentsTableView *studentsTableView;

@end

@implementation tchGradesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Tell the students table to setup itself
    [self.studentsTableView setupForClass:self.activeClass];
    
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
