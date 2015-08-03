//
//  tchImport1VC.m
//  Teechers App
//
//  Created by fran on 4/20/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImport1VC.h"
#import "tchImport2VC.h"

@interface tchImport1VC ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tchBottomMarginConst;
@property (strong, nonatomic) IBOutlet UITextView *tchStudentsTextArea;
@property (strong, nonatomic) IBOutlet UITextView *tchLineCountTextArea;
@end

@implementation tchImport1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tchStudentsTextArea.text = [self.tchStudentsTextArea valueForKey:@"placeholder"];
    self.tchStudentsTextArea.textColor = [UIColor lightGrayColor];
    
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

#pragma mark - Text View placeholder
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if ([self.tchStudentsTextArea.text isEqualToString:[self.tchStudentsTextArea valueForKey:@"placeholder"]]) {
        self.tchStudentsTextArea.text = @"";
        self.tchStudentsTextArea.textColor = [UIColor blackColor];
    }

    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(self.tchStudentsTextArea.text.length == 0){
        self.tchStudentsTextArea.textColor = [UIColor lightGrayColor];
        self.tchStudentsTextArea.text = [self.tchStudentsTextArea valueForKey:@"placeholder"];
        [self.tchStudentsTextArea resignFirstResponder];
    }
    
    float nameRows = round( (textView.contentSize.height - textView.textContainerInset.top - textView.textContainerInset.bottom) / textView.font.lineHeight );
    
    float indexRows = round( (self.tchLineCountTextArea.contentSize.height - self.tchLineCountTextArea.textContainerInset.top - self.tchLineCountTextArea.textContainerInset.bottom) / self.tchLineCountTextArea.font.lineHeight );
    
    if (nameRows != indexRows) {
        
        NSString *newText = @"";
        
        for (int i=1; i<=nameRows; i++) {
            newText = [NSString stringWithFormat:@"%@%i\n", newText, i];
        }
        
        self.tchLineCountTextArea.text = newText;
        
    }
    
}

#pragma mark - Parallel scrolling
-(void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView
{
    [self.tchLineCountTextArea setContentOffset:scrollView.contentOffset];
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


#pragma mark - dismiss view
- (IBAction)dismissVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // tell delegate (view controller)
    //if ([_delegate respondsToSelector:@selector(editDayWasDismissed:changedDay:)]) {
    //[_delegate editDayWasDismissed:nil];
    //}
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"toNextStep"]) {
        
        // procesar los datos del input
        NSArray *studentsArray = [NSArray arrayWithArray:[self parseInput]];
        
        //pasar el managed context al siguiente VC
        tchImport2VC *nextViewController = [segue destinationViewController];
        nextViewController.managedObjectContext = self.managedObjectContext;
        
        // pass the students array to the next VC
        nextViewController.studentsData = studentsArray;
        
    }
    
    
}

// unwind to main menu function
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}




@end
