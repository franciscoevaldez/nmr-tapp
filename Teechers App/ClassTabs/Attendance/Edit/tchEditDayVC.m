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
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (strong, nonatomic) IBOutlet tchEditDayFormTable *formTable;
@property (strong, nonatomic) NSArray *dataArray;

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
    
    // reload the form
    [self.formTable reloadData];
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    
    // give the focus to the first input
    //[self.dateInput becomeFirstResponder];
    
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

#pragma mark - keyboard adjustments & listeners (ABSTRACTABLE)
// registrar los listeners para el teclado
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    // keyboard is shown, change the constraint to adjust the content:
    
    // get notification info & keyboard frame
    NSDictionary* info = [aNotification userInfo];
    CGRect kKeyBoardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // add frame height to the constraint's constant
    self.bottomConstraint.constant = kKeyBoardFrame.size.height;
    
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    
    // keyboard will be hidden, return bottom constraint to 0:
    self.bottomConstraint.constant = 0;
    
}

#pragma mark - dismiss view
- (IBAction)dismissVC:(id)sender {
    
    // reset the managed object context
    [self.activeClass.managedObjectContext rollback];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // tell delegate (view controller)
    //if ([_delegate respondsToSelector:@selector(editDayWasDismissed:changedDay:)]) {
    [_delegate editDayWasDismissed:nil];
    //}
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get the current date object from table
    [self.formTable refreshData];
    ClassDay *newDay = self.formTable.editableObject;
    
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
