//
//  tchAttendanceMenu.m
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceMenu.h"
#import "tchAttDayBandColDS.h"
#import "tchStoreCoordinator.h"
#import "ClassDay.h"

@interface tchAttendanceMenu ()

@property (strong, nonatomic) IBOutlet tchAttDayBandColDS *tchDayBandDataSource;
@property (strong, nonatomic) IBOutlet UICollectionView *dayBandCollection;

@end

@implementation tchAttendanceMenu

-(void)setupMenu{
    
    self.deployed = FALSE;
    self.heightConstraint.constant = 0.0f;
    
}

/*
-(void)toggleMenu{
    
    self.deployed = !self.deployed;
    
}
 */

// setup the menu for the class coming from the view controller
-(void)setupForClass:(AClass *)activeClass{

    // set the day band data source
    [self.tchDayBandDataSource setupForClass:activeClass];
    
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
                                   [self.storeCoordinator deleteClassDay:currentDay];
                                   
                                   // tell the delegate to reload data
                                   [self.delegate reloadViewsData];
                                   
                                   
                               }];
    
    // Add actions to the controller so they will appear
    [alert addAction:doDisregard];
    [alert addAction:doDelete];
    
    // tell the delegate to delete the selected day and pass the alert
    [self.delegate showAlert:alert];

    
}

#pragma mark - react to data reload
- (void)reloadData{
    
    [self.dayBandCollection reloadData];
    [self.dayBandCollection reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
