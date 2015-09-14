//
//  tchStudentSummaryDelegate.m
//  Teechers App
//
//  Created by fran on 9/12/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchStudentSummaryDelegate.h"
#import "tchStudentsTableDelegate.h"

#import "Student.h"

@implementation tchStudentSummaryDelegate

// Handling row selection
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // hide the highlight
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// Handling row size
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // if the cell is the first of the section, should be 50
    if (indexPath.row == 0) {
        return 50;
    }
    
    // otherwise it should return 40
    return 40;
    
}

// handle change name
- (IBAction)changeNamePressed:(id)sender {
    
    // get the current selected student
    Student *selectedStudent = [self.ownerViewController getSelectedStudent];
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Adjust student name"
                                message:@""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    // add the text input
    [alert addTextFieldWithConfigurationHandler:^(UITextField *newNameTextField)
     {
         newNameTextField.placeholder = [NSString stringWithFormat:@"%@", selectedStudent.name];
         newNameTextField.text = [NSString stringWithFormat:@"%@", selectedStudent.name];
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
                                       
                                       // tell the active student to change its name
                                       [selectedStudent changeStudentNameTo:text];
                                       
                                       // tell the students table to reload itself
                                       [self.ownerViewController.studentsTable reloadData];
                                       
                                   }
                                   
                               }];
    
    [alert addAction:doChange];
    
    
    // tell the delegate to delete the selected day and pass the alert
    [self.ownerViewController showAlert:alert];
    
}

// handle delete student
- (IBAction)deleteStudentPressed:(id)sender {
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Delete student?"
                                message:@"You are about to delete a student. Actually, we recommend you don't do this because: \n- This action CANNOT be undone \n - This information CANNOT be recovered. \nYou still want to delete this student from this class?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    // Make choices for the user using alert actions.
    UIAlertAction *doDisregard = [UIAlertAction
                                  actionWithTitle:@"No, leave it."
                                  style:UIAlertActionStyleCancel
                                  handler:nil];
    
    
    UIAlertAction *doDelete = [UIAlertAction
                               actionWithTitle:@"Yes, delete it."
                               style:UIAlertActionStyleDestructive
                               handler:^(UIAlertAction *action) {
                                   
                                   // get the current selected student
                                   Student *selectedStudent = [self.ownerViewController getSelectedStudent];
                                   
                                   // collapse the cell
                                   //[(tchStudentsTableDelegate*)self.ownerViewController.studentsTable.delegate reloadSelectedCellInTableView:self.ownerViewController.studentsTable];
                                   
                                   // tell the table to deselect its cell
                                   [(tchStudentsTableDelegate*)self.ownerViewController.studentsTable.delegate clearSelectionForTableView:self.ownerViewController.studentsTable];
                                   
                                   // delete the student
                                   [selectedStudent deleteStudent];
                                   
                                   // tell the view to reload the data
                                   [self.ownerViewController reloadViewsData];
                                   
                                   
                                   
                               }];
    
    // Add actions to the controller so they will appear
    [alert addAction:doDisregard];
    [alert addAction:doDelete];
    
    // tell the delegate to delete the selected day and pass the alert
    [self.ownerViewController showAlert:alert];
    
}

@end
