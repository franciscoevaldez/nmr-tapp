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
- (void)editGradeWasDismissed:(Evaluation *)changedDay{
    
    // if there was actually a change when editing
    if (changedDay) {
        
        [self reloadViewsData];
        
        // scroll to the edited day
        //[self scrollToDay:changedDay];
        
    }

}


#pragma mark - Column Handling (non-abstractable)
- (NSInteger)getMaxScroll{
    return [[self.activeClass.evaluations allObjects] count];
}

- (Evaluation*)getCurrentEvaluation{
    
    // get the day for that index
    Evaluation *currentEvaluation = [self.activeClass getEvaluationForIndex:self.currentColumnIndex];
    
    // return the current Day
    return currentEvaluation;
    
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
