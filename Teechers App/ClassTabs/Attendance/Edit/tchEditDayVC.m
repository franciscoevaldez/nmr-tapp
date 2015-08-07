//
//  tchEditDayVC.m
//  Teechers App
//
//  Created by fran on 28/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditDayVC.h"
#import "tchDatePickerField.h"

#import "tchEditFormTable.h"

@interface tchEditDayVC ()

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;
@property (strong, nonatomic) IBOutlet tchEditFormTable *formTable;

@end

@implementation tchEditDayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // tell the form table to set its containers
    [self.formTable setupCellArrayFromPlist:@"tchAttendancePL"];
    
    // if there is a class to edit, change the view title
    if (self.dayToEdit) {
        self.viewTitle.text = @"Edit day";
    
        // if there is an editable object, tell the data dictionary to import it
        [self.formTable importDataFrom:self.dayToEdit];
        
    }
    
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [_delegate editDayWasDismissed:nil];
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get the current date object from table
    [self.formTable refreshData];
    
    // get the value array
    NSDictionary *valueArray = self.formTable.formDataDict;
    
    // if there is not a day to edit, create a new day
    if (!self.dayToEdit) {
        
        // create the class day with the values
        self.dayToEdit = [self.activeClass createNewDay:[valueArray valueForKey:@"date"] withName:[valueArray valueForKey:@"name"]];
        
        
    } else {
        
        // update the values for the day to edit
        [self.dayToEdit updateDayWithDate:[valueArray valueForKey:@"date"] name:[valueArray valueForKey:@"name"]];
        
    }
    
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // pass the new day to the delegate
    [_delegate editDayWasDismissed:self.dayToEdit];
    
    
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
