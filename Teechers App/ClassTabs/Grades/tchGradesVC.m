//
//  tchGradesVC.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesVC.h"

@implementation tchGradesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Tell the students table the deployed cell height
    self.studentsTable.deployedCellHeight = 60+90;
    
    [self setupForClass:self.activeClass];
    
}

#pragma mark - Dialog Handling 
- (void)editGradeWasDismissed:(Evaluation *)changedEval{
    
    [self reloadViewsData];
    
    // if there was actually a change when editing
    if (changedEval) {
        
        // scroll to the edited day
        [self scrollToEvaluation:changedEval];
        
    }

}

#pragma mark - Column scrolling
- (void)scrollToEvaluation:(Evaluation*)evaluation{
    
    // get the index for the class day
    NSInteger newIndex = [evaluation getSortingIndex];
    
    // call scroll to the index of that day
    [self scrollToIndex:newIndex];
    
}

#pragma mark - Column Handling
- (NSInteger)getMaxScroll{
    return [[self.activeClass.evaluations allObjects] count];
}

- (Evaluation*)getCurrentEvaluation{
    
    // get the day for that index
    Evaluation *currentEvaluation = [self.activeClass getEvaluationForIndex:self.currentColumnIndex];
    
    // return the current Day
    return currentEvaluation;
    
}

-(id)getCurrentColumnItem
{
    
    // get the day for that index
    Evaluation *currentEvaluation = [self.activeClass getEvaluationForIndex:self.currentColumnIndex];
    
    // return the current Day
    return currentEvaluation;
    
}

#pragma mark - Present Alert
- (void)showAlert:(UIAlertController*)alertController
{
    
    // Present the dialog
    [self presentViewController:alertController animated:YES completion:nil];
    
    // If menu is deployed, close it
    if (self.optionsMenu.status) {
        
        [self headerWasTapped];
        
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // to new grade
    if ([[segue identifier]isEqualToString:@"toAddGradeSegue"]) {
        
        // toggle the menu
        [self headerWasTapped];
        
        // prepare the edit/create view controller
        tchEditGrade1VC *destinationVC = [segue destinationViewController];
        
        // set view controller as delegate
        destinationVC.delegate = self;
        
        // theres no day to edit
        destinationVC.evaluationToEdit = nil;
        
        // pass the active class
        destinationVC.activeClass = self.activeClass;
        
    }
    
    // to edit grade
    if ([[segue identifier]isEqualToString:@"toEditGradeSegue"]) {
        
        // toggle the menu
        [self headerWasTapped];
        
        // prepare the edit/create view controller
        tchEditGrade1VC *destinationVC = [segue destinationViewController];
        
        // set view controller as delegate
        destinationVC.delegate = self;
        
        // get the edit to pass
        destinationVC.evaluationToEdit = [self getCurrentEvaluation];
        
        // pass the active class
        destinationVC.activeClass = self.activeClass;
        
    }
    
    
    
}



@end
