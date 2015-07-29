//
//  tchAttendanceVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceVC.h"

#import "ClassDay.h"

@implementation tchAttendanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // pass the class to the children
    [self setupForClass:self.activeClass];
    
    // tell the table of the deployed cell height
    self.studentsTable.deployedCellHeight = 241;
    
    // Hide the menu
    self.optionsMenu.heightConstraint.constant = 43.0;
    
    // no on take attendance
    self.takeAttendanceMode = false;
    
}

- (void)scrollToDay:(ClassDay*)classDay{
    
    // get the index for the class day
    NSInteger newIndex = [self.activeClass getSortIndexForDay:classDay];
    
    // call scroll to the index of that day
    [self scrollToIndex:newIndex];
    
}

#pragma mark - Column Handling
- (NSInteger)getMaxScroll{
    return [[self.activeClass.classDays allObjects] count];
}


#pragma mark - Edit Day Modal handling
- (void)editDayWasDismissed:(ClassDay*)changedDay{
    
    [self reloadViewsData];
    
    // if there was actually a change when editing
    if (changedDay) {
        
        // scroll to the edited day
        [self scrollToDay:changedDay];
        
    }
    
    
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

#pragma mark - Toggle attendance mode
- (void)toggleContinuousMode
{
    if (!self.takeAttendanceMode) {
        
        [self optionsMenuClose];
        
        self.takeAttendanceMode = true;
        self.studentsTable.continuousMode = true;
        
        // select the first cell of the students table
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.studentsTable triggerSelectAtIndexPath:indexPath];
        
    }
}


-(id)getCurrentColumnItem
{
    
    // get the current day index
    NSInteger dayIndex = self.currentColumnIndex;
    
    // get the day for that index
    ClassDay *currentDay = [self.activeClass getDayForIndex:dayIndex];
    
    // return the current Day
    return currentDay;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // to new day
    if ([[segue identifier]isEqualToString:@"toCreateDay"]) {
        
        // toggle the menu
        [self headerWasTapped];
        
        // prepare the edit/create view controller
        tchEditDayVC *destinationVC = [segue destinationViewController];
        
        // set view controller as delegate
        destinationVC.delegate = self;
        
        // theres no day to edit
        destinationVC.dayToEdit = nil;
        
        // pass the active class
        destinationVC.activeClass = self.activeClass;
        
    }
    
    // to edit this day
    if ([[segue identifier]isEqualToString:@"toEditDay"]) {
        
        // toggle the menu
        [self headerWasTapped];
        
        // get currently selected day
        if (!self.currentColumnIndex) {
            self.currentColumnIndex = 0;
        }
        
        NSArray *sortedDays = [self.activeClass getDaysSorted];
        ClassDay *currentDay = [sortedDays objectAtIndex:self.currentColumnIndex];
        
        // prepare the edit/create view controller
        tchEditDayVC *destinationVC = [segue destinationViewController];
        // set view controller as delegate
        destinationVC.delegate = self;
        
        // pass current day for edition
        destinationVC.dayToEdit = currentDay;
        
        // pass the active class
        destinationVC.activeClass = self.activeClass;
        
    }
    
    
}


@end
