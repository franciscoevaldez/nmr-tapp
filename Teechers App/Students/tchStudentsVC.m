//
//  tchStudentsVC.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsVC.h"
#import "tchStudentsTableDS.h"
#import "tchStudentsHeader.h"

@interface tchStudentsVC ()

@property (strong, nonatomic) IBOutlet tchStudentsHeader *tchStudentsHeader;
@property (strong, nonatomic) IBOutlet tchStudentsTableDS *tchStudentsTableDataSource;

@end

@implementation tchStudentsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    // Setup the header for this class
    [self.tchStudentsHeader setupHeaderForClass:self.activeClass];
    
    // Pass the class to the Students data source
    [self.tchStudentsTableDataSource setupForClass:self.activeClass];
    
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
