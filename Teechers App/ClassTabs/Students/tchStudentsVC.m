//
//  tchStudentsVC.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsVC.h"

#import "tchAStudentCell.h"

@interface tchStudentsVC ()

@end

@implementation tchStudentsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get the screen height
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    
    // Tell the students table the deployed cell height
    self.studentsTable.deployedCellHeight = 60.0 + (screenHeight - 60.0) - 80.0 - 54.0;
    
    self.studentsTable.isEnabled = true;
    
    [self setupForClass:self.activeClass];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Get currently selected student
- (Student*)getSelectedStudent
{
    
    // check the existance of a selected element
    NSInteger selectedIndex =  self.studentsTable.deployedPath.row;
    
    if (!selectedIndex) {
        return nil;
    }
    
    // pick up the student element
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    tchAStudentCell *selectedCell = (tchAStudentCell*)[self.studentsTable cellForRowAtIndexPath:selectedIndexPath];
    Student *selectedStudent = selectedCell.studentForCell;
    
    // return it
    return selectedStudent;
    
}

#pragma mark - Edition checking
-(void)checkEditionEnable{
    
    self.editionEnabled = true;
    [self.studentsTable enableTableNewStatus:true];
    
}

#pragma mark - Present Alert
- (void)showAlert:(UIAlertController*)alertController
{
    
    // Present the dialog
    [self presentViewController:alertController animated:YES completion:nil];
    
    
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
