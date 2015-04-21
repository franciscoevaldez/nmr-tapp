//
//  tchImport1VC.m
//  Teechers App
//
//  Created by fran on 4/20/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImport1VC.h"
#import "tchMainMenuVC.h"

@interface tchImport1VC ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tchBottomMarginConst;
@property (strong, nonatomic) IBOutlet UITextView *tchStudentsTextArea;
@end

@implementation tchImport1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // configurar los listeners del teclado
    [self registerForKeyboardNotifications];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.tchBottomMarginConst.constant = kKeyBoardFrame.size.height;
    
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    
    // keyboard will be hidden, return bottom constraint to 0:
    self.tchBottomMarginConst.constant = 0;
    
}


#pragma mark - Next Button
- (IBAction)nextButtonPressed:(id)sender {
    
    // procesar los datos del input
    NSArray *studentsArray = [NSArray arrayWithArray:[self parseInput]];
    NSLog(@"%@", studentsArray);
    
}


#pragma mark - Input Parse
// Parse the input information, each line is a student name. Surnames and other data will be ignored for now.
- (NSArray*)parseInput
{
    // get the input text to a variable
    NSString *inputData = self.tchStudentsTextArea.text;
    
    // split input data into array (each line a new element)
    NSArray *newStudents = [inputData componentsSeparatedByString:@"\n"];
    
    // return the completed array
    return newStudents;
    
}



#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
