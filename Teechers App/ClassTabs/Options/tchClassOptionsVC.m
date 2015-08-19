//
//  tchClassOptionsVC.m
//  Teechers App
//
//  Created by fran on 8/19/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassOptionsVC.h"
#import "tchClassOptionsTable.h"

@interface tchClassOptionsVC ()

@property (strong,nonatomic) IBOutlet UILabel *classNameLabel;
@property (strong,nonatomic) IBOutlet tchClassOptionsTable *optionsTable;

@end

@implementation tchClassOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set the label text to the class name
    self.classNameLabel.text = self.activeClass.name;
    
    // pass the active class to the actions table
    self.optionsTable.activeClass = self.activeClass;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Change class name
-(void)callChangeName{
    
    
    
}

#pragma mark - Add student

#pragma mark - Archive class


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
