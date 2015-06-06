//
//  tchEditGrade1VC.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditGrade1VC.h"
#import "tchDatePickerField.h"

#import "AClass+tchAClassExt.h"

@interface tchEditGrade1VC ()



@property (strong,nonatomic) NSArray *usedNamesArray;

@end

@implementation tchEditGrade1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // check if there is a evaluation to edit...
    if (self.evaluationToEdit) {
        
        // change the view title
        self.titleLabel.text = @"Edit grade";
        
        // set name to the input
        self.nameInput.text = self.evaluationToEdit.name;
        
        // set short name
        self.shortInput.text = self.evaluationToEdit.nameShort;
        
        // set max grade
        self.maxGradeInput.text = [NSString stringWithFormat:@"%@", self.evaluationToEdit.range];
        
        // set date to the input
        [self.dateInput changeDatePicker:self.dateInput.pickedDate];
        
        
    }
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    // give the focus to the first input
    [self.nameInput becomeFirstResponder];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data handling
- (Evaluation*)createEvaluation{
    
    // create a new evaluation object
    Evaluation *newEvaluation;
    
    newEvaluation = [self.activeClass createAndStoreNewEvaluation:self.nameInput.text
                                                           withID:self.shortInput.text
                                                         maxGrade:[self.maxGradeInput.text integerValue]
                                                             date:self.dateInput.pickedDate];
    
    return newEvaluation;
}

#pragma mark - Field Return Sequence
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
        // First text field
    if (textField == self.nameInput) {
        
        [textField resignFirstResponder];
        [self.shortInput becomeFirstResponder];
    
        // Second text field
    } else if (textField == self.shortInput) {
        
        [textField resignFirstResponder];
        [self.dateInput becomeFirstResponder];
        
        // Last text field
    } else if (textField == self.dateInput) {
        
        [textField resignFirstResponder];
        [self.maxGradeInput becomeFirstResponder];
        
        // Last text field
    } else if (textField == self.maxGradeInput){
    
        // here you can define what happens
        // when user presses return on the email field
        NSLog(@"siguiente!");
        
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if (textField == self.nameInput) {
        
        // get the full name
        NSString *fullTitle = self.nameInput.text;
        
        // get Inicial
        NSString *initial = [fullTitle substringToIndex:1];
        NSString *nameToCheck = initial;
        
        // check if we have previous names
        if (!self.usedNamesArray) {
            
            // get all the evaluations
            NSArray *evaluationsArray = [self.activeClass.evaluations allObjects];
            
            // get all the names
            NSMutableArray *namesArray;
            
            for (int ind=0; ind < [evaluationsArray count]; ind++) {
                
                Evaluation *currentEval = [evaluationsArray objectAtIndex:ind];
                [namesArray addObject:currentEval.gradeID];
                
            }
            
            self.usedNamesArray = namesArray;
            
        }
        
        // initialize the name check
        BOOL happyWithTheName = NO;
        int numberAdder = 0;
        
        // loop while we are not happy with the name
        while (!happyWithTheName) {
            
            // name fits initially...
            happyWithTheName = YES;
            
            // check every name...
            for (NSString *name in self.usedNamesArray) {
                // ...if name coincides with one, then we are not happy
                if (nameToCheck == name) {
                    happyWithTheName = NO;
                }
            }
            
            // if we are not happy with the name...
            if (!happyWithTheName) {
                // ...add one to the counter...
                numberAdder = numberAdder+1;
                // ...and change the name to check
                nameToCheck = [NSString stringWithFormat:@"%@%i", initial, numberAdder];
            }
            
        }
        
        // once we are happy with a name, set it to the short name field
        self.shortInput.text = nameToCheck;
        
        
    }
    
    return YES;
}

#pragma mark - Cancelation & confirmation
- (IBAction)dismissVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

    [_delegate editGradeWasDismissed:nil];
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    [self createEvaluation];
    
    /*
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
     */
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [_delegate editGradeWasDismissed:nil];
    
    
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
