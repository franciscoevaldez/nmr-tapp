//
//  tchEditDayVC.m
//  Teechers App
//
//  Created by fran on 28/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditDayVC.h"

#import "tchStoreCoordinator.h"
#import "tchDatePickerField.h"

@interface tchEditDayVC ()

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;
@property (strong, nonatomic) IBOutlet tchDatePickerField *dateInput;
@property (strong, nonatomic) IBOutlet UITextField *titleInput;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (strong, nonatomic) IBOutlet tchStoreCoordinator *storeCoordinator;

@end

@implementation tchEditDayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // if there is a class to edit…
    if (self.dayToEdit) {
        
        // change the view title
        self.viewTitle.text = @"Edit day";
        
        // set the date into the input
        [self.dateInput changeDatePicker:self.dayToEdit.date];
        
        // set the name into the input
        self.titleInput.text = self.dayToEdit.name;
        
        
    }
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    // give the focus to the first input
    [self.dateInput becomeFirstResponder];
    
    // pass the active class to the store coordinator
    self.storeCoordinator.activeClass = self.activeClass;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// pass focus on return
#pragma mark - acciones de text fields
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.dateInput) {
        
        [textField resignFirstResponder];
        [self.titleInput becomeFirstResponder];
        
    } else if (textField == self.titleInput) {
        
        // here you can define what happens
        // when user presses return on the email field
        NSLog(@"siguiente!");
        
    }
    return YES;
}

#pragma mark - keyboard adjustments & listeners
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // tell delegate (view controller)
    //if ([_delegate respondsToSelector:@selector(editDayWasDismissed:changedDay:)]) {
    [_delegate editDayWasDismissed:nil];
    //}
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get data from the inputs
    NSDate *newDate = self.dateInput.pickedDate;
    NSString *newTitle = self.titleInput.text;
    
    //ClassDay *newDay = [[ClassDay alloc] init];
    
    // if theres no day to edit (means we are creating)
    if (!self.dayToEdit) {
        
        // tell the data coordinator to add a new day
        ClassDay *newDay = [self.storeCoordinator createAndStoreNewDay:newDate withName:newTitle];
        
        // dismiss the view
        [self dismissViewControllerAnimated:YES completion:nil];
        
        // pass the new day to the delegate
        [_delegate editDayWasDismissed:newDay];
        
    } else {
        
        // tell the data coordinator to edit the day with the new data
        ClassDay *newDay = [self.storeCoordinator updateAndStoreDay:self.dayToEdit withDate:newDate withName:newTitle];
        
        // dismiss the view
        [self dismissViewControllerAnimated:YES completion:nil];
        
        // pass the new day to the delegate
        [_delegate editDayWasDismissed:newDay];
        
    }
    
    
    
    
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
