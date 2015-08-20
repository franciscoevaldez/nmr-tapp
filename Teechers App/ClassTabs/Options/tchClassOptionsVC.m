//
//  tchClassOptionsVC.m
//  Teechers App
//
//  Created by fran on 8/19/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassOptionsVC.h"
#import "tchClassOptionsTable.h"

#import "Student.h"

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
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Change class name"
                                message:@"Type in a new name"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    // add the text input
    [alert addTextFieldWithConfigurationHandler:^(UITextField *newNameTextField)
     {
         newNameTextField.placeholder = [NSString stringWithFormat:@"%@", self.activeClass.name];
         newNameTextField.text = [NSString stringWithFormat:@"%@", self.activeClass.name];
     }];
    
    
    // Make choices for the user using alert actions.
    UIAlertAction *doDisregard = [UIAlertAction
                                  actionWithTitle:@"Cancel"
                                  style:UIAlertActionStyleDefault
                                  handler:nil];
    
    [alert addAction:doDisregard];
    
    
    UIAlertAction *doChange = [UIAlertAction
                               actionWithTitle:@"Confirm"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action) {

                                   NSString *text = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                                   
                                   if (text) {
                                       
                                       [self.activeClass changeClassName:text];
                                       self.classNameLabel.text = text;
                                       
                                   }
                                   
                               }];
    [alert addAction:doChange];
    
    
    // show the alert
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Add student
-(void)callAddStudent{
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Add a student"
                                message:@"Type in the student's name"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    // add the text input
    [alert addTextFieldWithConfigurationHandler:^(UITextField *newNameTextField)
     {
         newNameTextField.placeholder = @"Student name";
     }];
    
    
    // Make choices for the user using alert actions.
    UIAlertAction *doDisregard = [UIAlertAction
                                  actionWithTitle:@"Cancel"
                                  style:UIAlertActionStyleDefault
                                  handler:nil];
    
    [alert addAction:doDisregard];
    
    
    UIAlertAction *doChange = [UIAlertAction
                               actionWithTitle:@"Add"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action) {
                                   
                                   NSString *text = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                                   
                                   if (text) {
                                       
                                       // Student *newStudent = [Student createStudentWithName:text inClass:self.activeClass];
                                       [self.activeClass createStudentWithName:text];
                                       
                                   }
                                   
                                   
                               }];
    [alert addAction:doChange];
    
    
    // show the alert
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Archive class


#pragma mark - Share as xls
//-(void)callExportClassAs:(tchExportType)exportType{
    
    //[self.activeClass exportClassAsCSV];
    
//}

-(void)callExport{
    
    
    
    NSString * message = self.activeClass.name;
    
    NSString * csvFile = [self.activeClass exportClassAsCSV];
    
    NSArray * shareItems = [NSArray arrayWithObjects:message, [NSURL fileURLWithPath:csvFile], nil];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    
    [self presentViewController:avc animated:YES completion:nil];
    
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
