//
//  tchImport2VC.m
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImport2VC.h"

@interface tchImport2VC ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tchBottomConstraint;
@property (strong, nonatomic) IBOutlet UITextField *tchClassName;
@property (strong, nonatomic) IBOutlet UITextField *tchInstitutionName;

@end

@implementation tchImport2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // register the keyboard listeners
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - acciones de text fields
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tchClassName) {
        [textField resignFirstResponder];
        [self.tchInstitutionName becomeFirstResponder];
    } else if (textField == self.tchInstitutionName) {
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
    self.tchBottomConstraint.constant = kKeyBoardFrame.size.height;
    
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    
    // keyboard will be hidden, return bottom constraint to 0:
    self.tchBottomConstraint.constant = 0;
    
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
