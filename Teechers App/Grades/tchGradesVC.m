//
//  tchGradesVC.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesVC.h"

#import "tchStudentsTableView.h"
#import "tchGradesMenu.h"
#import "tchEditGrade1VC.h"

@interface tchGradesVC ()

@property (strong,nonatomic) IBOutlet tchStudentsTableView *studentsTableView;
@property (strong,nonatomic) IBOutlet tchGradesHeader *headerView;
@property (strong,nonatomic) IBOutlet tchGradesMenu *dropMenuView;

@property (assign, nonatomic) NSInteger currentDayIndex;

@end

@implementation tchGradesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Tell the students table to setup itself
    [self.studentsTableView setupForClass:self.activeClass];
    
    // Setup the header for this class
    [self.headerView setupHeaderForClass:self.activeClass];
    
    // Setup the menu for this class
    [self.dropMenuView setupForClass:self.activeClass];
    
}

#pragma mark - Data Handling (ABSTRACTABLE)
// tell views to reload its data
- (void)reloadViewsData {
    
    // refresh the students table
    [self.studentsTableView reloadAllData];
    
    // refresh the header data source
    [self.headerView reloadData];
    
    // refresh the menu
    [self.dropMenuView reloadData];
    
    
}

#pragma mark - Dialog Handling 
- (void)editGradeWasDismissed:(Evaluation *)changedDay{
    NSLog(@"just dismissed");
}

#pragma mark - Menu Handling (ABSTRACTABLE)
- (void)headerWasTapped {
        
    if (!self.dropMenuView.status) {
        
        [self dropMenuDeploy];
        
    } else {
        
        [self dropMenuClose];
        
    }
    
}

-(void)dropMenuDeploy {
    
    if (!self.dropMenuView.status) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropMenuView.heightConstraint.constant = self.dropMenuView.heightForFullDeploy;
            [self.view layoutIfNeeded];
        }];
        
        [self.dropMenuView toggleMenu];
        [self.headerView menuWasToggled];
        
    }
    
}

-(void)dropMenuClose {
    
    if (self.dropMenuView.status) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.dropMenuView.heightConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
        
        [self.dropMenuView toggleMenu];
        [self.headerView menuWasToggled];
        
    }
    
}

#pragma mark - Column Handling (non-abstractable)
- (NSInteger)getMaxScroll{
    return [[self.activeClass.classDays allObjects] count];
}

#pragma mark - Column Handling (ABSTRACTABLE)
- (IBAction)swipeLeftDone:(id)sender {
    
    NSInteger maxScroll = [self getMaxScroll];
    
    if (self.currentDayIndex < (maxScroll-1) && (!self.dropMenuView.status)){
        
        [self scrollToIndex:self.currentDayIndex+1];
        
    }
    
}

- (IBAction)swipeRightDone:(id)sender {
    
    // check the scroll is available
    if (self.currentDayIndex > 0 && (!self.dropMenuView.status)) {
        
        [self scrollToIndex:self.currentDayIndex-1];
        
    }
    
}

- (void)scrollToIndex:(NSInteger)newIndex{
    
    // Tell header to scroll to new index
    //[self.tchAttendanceHeader performDayScrollToIndex:newIndex];
    [self.headerView performColumnScrollToIndex:newIndex];
    
    // Tell the table to perform the scroll
    [self.studentsTableView performDayScrollToIndex:newIndex];
    
    // If menu is deployed, close it
    [self dropMenuClose];
    
    // get the new index to VC property
    self.currentDayIndex = newIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // to new day
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
    
    
    
}



@end
