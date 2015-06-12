//
//  tchAttendanceMenu.m
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceMenu.h"
#import "ClassDay+tchClassDayExt.h"

@implementation tchAttendanceMenu

-(void)setupForClass:(AClass *)activeClass{
    
    // heights
    self.heightForFullDeploy = 210;
    self.heightForSemiDeploy = 50;
    
    // default variable init
    [self defaultInit];
}

-(IBAction)toggleAttendanceMode:(id)sender{
    
    [self.delegate toggleContinuousMode];
    
}


#pragma mark - Delete a day
-(IBAction)removeDay:(UIButton *)sender{
    
    // Alert style
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Remove this day?"
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
                                   ClassDay *currentDay = [self.delegate getCurrentColumnItem];
                                   
                                   // tell the store coordinator to delete that day
                                   [currentDay deleteClassDay];
                                   
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
