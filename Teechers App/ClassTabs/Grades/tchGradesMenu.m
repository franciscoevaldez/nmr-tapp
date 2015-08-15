//
//  tchGradesMenu.m
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesMenu.h"
#import "Evaluation.h"

@implementation tchGradesMenu

// setup the menu for the class coming from the view controller
-(void)setupForClass:(AClass *)activeClass{
    
    // heights
    self.heightForFullDeploy = 160;
    self.heightForSemiDeploy = 50;
    
    // default variable init
    [self defaultInit];
}

-(void)toggleEditMode:(BOOL)enabled{
    
    self.btnEdit.enabled = enabled;
    self.btnRemove.enabled = enabled;
    
    if (enabled) {
        self.btnEdit.alpha = 1;
        self.btnRemove.alpha = 1;
    } else {
        self.btnEdit.alpha = 0.3f;
        self.btnRemove.alpha = 0.3f;
    }
    
}

-(IBAction)addGrade:(UIButton *)sender{
    
}

-(IBAction)editGrade:(UIButton *)sender{
        
}

-(IBAction)deleteGrade:(UIButton *)sender{
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Remove this evaluation?"
                                message:@"This action CANNOT be undone. Are you sure?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    // Make choices for the user using alert actions.
    UIAlertAction *doDisregard = [UIAlertAction
                                  actionWithTitle:@"No, leave it."
                                  style:UIAlertActionStyleCancel
                                  handler:nil];
    
    
    UIAlertAction *doDelete = [UIAlertAction
                               actionWithTitle:@"Yes, delete it."
                               style:UIAlertActionStyleDestructive
                               handler:^(UIAlertAction *action) {
                                   
                                   // get the current day
                                   Evaluation *currentEval = [self.delegate getCurrentColumnItem];
                                   
                                   // tell the store coordinator to delete that day
                                   [currentEval deleteEval];
                                   
                                   // tell the delegate to reload data
                                   [self.delegate reloadViewsData];
                                   
                                   
                               }];
    
    // Add actions to the controller so they will appear
    [alert addAction:doDisregard];
    [alert addAction:doDelete];
    
    // tell the delegate to delete the selected day and pass the alert
    [self.delegate showAlert:alert];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
