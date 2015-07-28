//
//  tchEditDayVC.m
//  Teechers App
//
//  Created by fran on 28/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditDayVC.h"
#import "tchDatePickerField.h"

#import "tchEditDayFormTable.h"

@interface tchEditDayVC ()

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;
@property (strong, nonatomic) IBOutlet tchEditDayFormTable *formTable;

@end

@implementation tchEditDayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // tell the form table to set its containers
    [self.formTable setupCellArray];
    
    // if there is a class to edit, change the view title
    if (self.dayToEdit) {
        self.viewTitle.text = @"Edit day";
    }
    
    // pass the day and class to work with to the form table
    [self.formTable setupForClassDay:self.dayToEdit andClass:self.activeClass];
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    // reload the form
    [self.formTable reloadData];
    
    // give the focus to the first input
    [self.formTable focusIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// pass focus on return
#pragma mark - acciones de text fields
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return YES;
    
}

#pragma mark - dismiss view
- (IBAction)dismissVC:(id)sender {
    
    // refresh and dont merge the changes
    if (self.dayToEdit) {
        [self.activeClass.managedObjectContext refreshObject:self.dayToEdit mergeChanges:NO];
    }

    // reset the managed object context
    [self.activeClass.managedObjectContext rollback];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [_delegate editDayWasDismissed:nil];
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get the current date object from table
    [self.formTable refreshData];
    ClassDay *newDay = (ClassDay*) self.formTable.editableObject;
    
    ClassDay *updatedDay;
    
    if (!self.dayToEdit) {
        updatedDay = [newDay updateDayWithDate:newDay.date name:newDay.name];
    } else {
        updatedDay = [self.dayToEdit updateDayWithDate:newDay.date name:newDay.name];
    }
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // pass the new day to the delegate
    [_delegate editDayWasDismissed:updatedDay];
    
    
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
