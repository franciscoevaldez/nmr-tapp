//
//  tchEditGrade1VC.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditGrade1VC.h"
#import "tchEditEvalFormTable.h"
//#import "tchDatePickerField.h"
//#import "AClass+tchAClassExt.h"

@interface tchEditGrade1VC ()

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;
@property (strong, nonatomic) IBOutlet tchEditEvalFormTable *formTable;

@property (strong,nonatomic) NSArray *usedNamesArray;

@end

@implementation tchEditGrade1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // tell the form table to set its containers
    [self.formTable setupCellArrayFromPlist:@"tchEvaluationsPL"];
    
    // if there is an evaluation to edit, change the view title
    if (self.evaluationToEdit) {
        self.viewTitle.text = @"Edit day";
    }
    
    // pass the evaluation and class to the form table to work with
    [self.formTable setupForEditableObject:self.evaluationToEdit inClass:self.activeClass];
    
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



#pragma mark - Cancelation & confirmation
- (IBAction)dismissVC:(id)sender {
    
    // refresh and dont merge the changes
    if (self.evaluationToEdit) {
        [self.activeClass.managedObjectContext refreshObject:self.evaluationToEdit mergeChanges:NO];
    }
    
    // reset the managed object context
    [self.activeClass.managedObjectContext rollback];
    
    [self dismissViewControllerAnimated:YES completion:nil];

    [_delegate editGradeWasDismissed:nil];
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get the current date object from table
    [self.formTable refreshData];
    
    Evaluation *newEval = (Evaluation*) self.formTable.editableObject;
    
    Evaluation *updatedEvaluation;
    
    if (!self.evaluationToEdit) {
        updatedEvaluation = [newEval updateEvaluation:newEval.name
                                        withShortName:newEval.nameShort
                                                 date:newEval.date
                                                range:newEval.range];
    } else {
        updatedEvaluation = [self.evaluationToEdit updateEvaluation:newEval.name
                                                      withShortName:newEval.nameShort
                                                               date:newEval.date
                                                              range:newEval.range];
    }
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // pass the new day to the delegate
    [_delegate editGradeWasDismissed:updatedEvaluation];
    
    
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
