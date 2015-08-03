//
//  tchFormViewController.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchFormViewController.h"

@interface tchFormViewController ()

@end

@implementation tchFormViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
