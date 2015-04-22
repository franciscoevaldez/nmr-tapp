//
//  tchImport2VC.m
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImport2VC.h"
#import "tchImportConfVC.h"
#import "tchClassImporter.h"

@interface tchImport2VC ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tchBottomConstraint;
@property (strong, nonatomic) IBOutlet UITextField *tchClassName;
@property (strong, nonatomic) IBOutlet UITextField *tchInstitutionName;
@property (strong, nonatomic) IBOutlet tchClassImporter *tchClassImporter;

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

#pragma mark - calling the new class importer
- (void)callNewClassImporter
{
    // pass the managed object context
    self.tchClassImporter.managedObjectContext = self.managedObjectContext;
    
    // pass the new class name
    self.tchClassImporter.theNewClassName = self.tchClassName.text;
    
    // pass the institution name
    self.tchClassImporter.institutionName = self.tchInstitutionName.text;
    
    // pass the students array
    self.tchClassImporter.studentsArray = self.studentsData;
    
    // call the importing magic
    [self.tchClassImporter parseAndSaveANewClass];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"toConfirmationStep"]) {
        
        // call the class importer
        [self callNewClassImporter];
        
        // pass managed object context to confirmation
        tchImportConfVC *nextViewController = [segue destinationViewController];
        nextViewController.managedObjectContext = self.managedObjectContext;
        
        
    }
    
}


@end
