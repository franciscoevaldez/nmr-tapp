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



#pragma mark - Text View placeholder
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([self.tchStudentsTextArea.text isEqualToString:[self.tchStudentsTextArea valueForKey:@"placeholder"]]) {
        self.tchStudentsTextArea.text = @"";
        self.tchStudentsTextArea.textColor = [UIColor blackColor];
    }

    return YES;
}

-(void)textViewDidChange:(UITextView *)textView
{
    
    if(self.tchStudentsTextArea.text.length == 0){
        self.tchStudentsTextArea.textColor = [UIColor lightGrayColor];
        self.tchStudentsTextArea.text = [self.tchStudentsTextArea valueForKey:@"placeholder"];
        [self.tchStudentsTextArea resignFirstResponder];
    }
    
    //[self checkTextLines];
    
}

-(BOOL)textView:(nonnull UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text
{
    
    [self checkTextLines];
    
    return YES;
    
}

-(void)checkTextLines
{
    /*
    float nameRows = round( (self.tchStudentsTextArea.contentSize.height - self.tchStudentsTextArea.textContainerInset.top - self.tchStudentsTextArea.textContainerInset.bottom) / self.tchStudentsTextArea.font.lineHeight );
     
    
    float indexRows = round( (self.tchLineCountTextArea.contentSize.height - self.tchLineCountTextArea.textContainerInset.top - self.tchLineCountTextArea.textContainerInset.bottom) / self.tchLineCountTextArea.font.lineHeight );
    
    if (nameRows != indexRows) {
        
        NSString *newText = @"";
        
        for (int i=1; i<=nameRows; i++) {
            newText = [NSString stringWithFormat:@"%@%i\n", newText, i];
        }
        
        self.tchLineCountTextArea.text = newText;
        
    }
     */
    
    // line count
    /*
    NSString *namesStrings = self.tchStudentsTextArea.text;
    NSInteger numberOfLines, index, stringLength = [namesStrings length];
    
    for (index = 0, numberOfLines = 0; index < stringLength; numberOfLines++)
        index = NSMaxRange([namesStrings lineRangeForRange:NSMakeRange(index, 0)]);
    
    
     */
    
    
    // new line counter text
    NSString *lineCounterText = @"1";
    
    // second line count
    NSLayoutManager *layoutManager = [self.tchStudentsTextArea layoutManager];
    NSInteger numberOfLines, cIndex, numberForPrint, numberOfGlyphs = [layoutManager numberOfGlyphs];
    NSRange lineRange;
    NSString *currentText = self.tchStudentsTextArea.text;
    NSString *currentNumber = @"";
    NSString *prevLine = @"";
    BOOL print = false;
    
    for (numberOfLines = 0, cIndex = 0, numberForPrint = 1; cIndex < numberOfGlyphs; numberOfLines++){
        
        currentNumber = @"";
        print = false;
        
        (void) [layoutManager lineFragmentRectForGlyphAtIndex:cIndex
                                               effectiveRange:&lineRange];
        
        cIndex = NSMaxRange(lineRange);
        
        
        // get text for range
        NSString *currentLine = [currentText substringWithRange:lineRange];
        
        // if current line has return, and the previous does, print
        if (!([currentLine rangeOfString:@"\n"].location == NSNotFound)
            && (!([prevLine rangeOfString:@"\n"].location == NSNotFound))) {
            print = true;
        }
        
        
        // if the current line doesnt have a return, but the previous one does, print
        if (([currentLine rangeOfString:@"\n"].location == NSNotFound)
            && (!([prevLine rangeOfString:@"\n"].location == NSNotFound))) {
            print = true;
        }
        
        // if the current line is the last, print
        if (cIndex == numberOfGlyphs && numberForPrint > 1) {
            print = true;
        }
        
        
        if (print) {
            
            // count next number
            numberForPrint++;
            
            // add it
            currentNumber = [NSString stringWithFormat:@"%ld", (long)numberForPrint];
            
        }
        
        // set this as a previous line (for the next loop)
        prevLine = currentLine;
        
        lineCounterText = [NSString stringWithFormat:@"%@%@\n", lineCounterText, currentNumber];
        
    }
    
    self.tchLineCountTextArea.text = lineCounterText;
    
}

#pragma mark - Parallel scrolling
-(void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView
{
    [self.tchLineCountTextArea setContentOffset:scrollView.contentOffset];
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
