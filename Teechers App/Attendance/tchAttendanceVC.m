//
//  tchAttendanceVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceVC.h"

#import "tchAttendanceTableDS.h"
#import "tchEditDayVC.h"
#import "tchAttendanceTableV.h"

#import "ClassDay.h"

@interface tchAttendanceVC () 

@property (strong, nonatomic) IBOutlet tchAttendanceHeader *tchAttendanceHeader;
@property (strong, nonatomic) IBOutlet tchAttDayBandColDel *tchDayBandDelegate;
@property (strong, nonatomic) IBOutlet tchAttendanceMenu *tchAttendanceMenu;
@property (strong, nonatomic) IBOutlet tchAttendanceTableV *tchStudentsTable;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;

@property (assign, nonatomic) NSInteger currentDayIndex;

@end

@implementation tchAttendanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Pass the class to the Students data source
    [self.tchStudentsTable setupForClass:self.activeClass];
    
    // Setup the header for this class
    [self.tchAttendanceHeader setupHeaderForClass:self.activeClass];
    
    // Setup the day band for this class (CHANGE!!!!)
    [self.tchAttendanceMenu setupForClass:self.activeClass];
    
    // set header delegate
    self.tchAttendanceHeader.delegate = self;
    
    // set day band delegate
    self.tchDayBandDelegate.delegate = self;
    
    // set menu delegate
    self.tchAttendanceMenu.delegate = self;
    
    // Hide the menu
    [self.tchAttendanceMenu setupMenu];
    
}



#pragma mark - Day Jumping
- (void)scrollToIndex:(NSInteger)newIndex{
    
    // Tell header to scroll to new index
    [self.tchAttendanceHeader performDayScrollToIndex:newIndex];
    
    // Tell the table to perform the scroll
    [self.tchStudentsTable performDayScrollToIndex:newIndex];
    
    // If menu is deployed, close it
    if (self.tchAttendanceMenu.deployed) {
        
        // close menu
        [UIView animateWithDuration:0.5 animations:^{
            self.menuHeightConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
        
        [self.tchAttendanceMenu toggleMenu];
        [self.tchAttendanceHeader menuWasToggled];
        
    }
    
    // get the new index to VC property
    self.currentDayIndex = newIndex;

}

- (void)scrollToDay:(ClassDay*)classDay{
    
    // get the index for the class day
    NSInteger newIndex = [self.activeClass getSortIndexForDay:classDay];
    
    // call scroll to the index of that day
    [self scrollToIndex:newIndex];
    
}


#pragma mark - Swipe Handling
- (IBAction)swipeLeftDone:(id)sender {
    
    NSInteger maxScroll = [[self.activeClass.classDays allObjects] count];
    
    if (self.currentDayIndex < (maxScroll-1)){
        
        [self scrollToIndex:self.currentDayIndex+1];
        
    }
    
}

- (IBAction)swipeRightDone:(id)sender {
    
    // check the scroll is available
    if (self.currentDayIndex > 0 && (!self.tchAttendanceMenu.deployed)) {
        
        [self scrollToIndex:self.currentDayIndex-1];
        
    }
    
}

#pragma mark - Header tapped
- (void)headerWasTapped {
    
    if (!self.tchAttendanceMenu.deployed) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.menuHeightConstraint.constant = 210;
            [self.view layoutIfNeeded];
        }];
        
    } else {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.menuHeightConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
        
    }
    
    [self.tchAttendanceMenu toggleMenu];
    [self.tchAttendanceHeader menuWasToggled];
    
}

#pragma mark - Reloading data
// tell views to reload its data
- (void)reloadViewsData
{
    
    // refresh the header data source
    [self.tchAttendanceHeader reloadData];
    
    // refresh the menu
    [self.tchAttendanceMenu reloadData];
    
    
}

#pragma mark - Edit Day Modal handling
- (void)editDayWasDismissed:(ClassDay*)changedDay{
    
    // if there was actually a change when editing
    if (changedDay) {
        
        [self reloadViewsData];
        
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
    if (self.tchAttendanceMenu.deployed) {
        
        [self headerWasTapped];
        
    }
    
}

- (ClassDay*)getCurrentDay
{
    
    // get the current day index
    NSInteger dayIndex = self.currentDayIndex;
    
    // get the day for that index
    ClassDay *currentDay = [self.activeClass getDayForIndex:dayIndex];
    
    // return the current Day
    return currentDay;
    
}

#pragma mark - TEMP: Add days (Remove!!)
- (IBAction)addDaysHotfix:(id)sender {
    // ONLY WHILE TESTING AND DEVELOPING: FEED A FAKE ARRAY WITH 5 DAYS ------------------------------
     
    // create first classDay object
    NSDateFormatter *aDateFormatter = [[NSDateFormatter alloc] init];
    [aDateFormatter setDateFormat:@"yyyy-MM-dd"];
     
    ClassDay *a1ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a1ClassDay.name = [NSString stringWithFormat:@"Presentacion"];
    a1ClassDay.dayID = [NSString stringWithFormat:@"DAY001"];
    NSString *tempClassDay = [NSString stringWithFormat:@"2014-04-04"];
    a1ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a1ClassDay.forClass = self.activeClass;
     
    ClassDay *a2ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a2ClassDay.name = [NSString stringWithFormat:@"Segunda"];
    a2ClassDay.dayID = [NSString stringWithFormat:@"DAY002"];
    tempClassDay = [NSString stringWithFormat:@"2014-04-14"];
    a2ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a2ClassDay.forClass = self.activeClass;
     
    ClassDay *a3ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a3ClassDay.name = [NSString stringWithFormat:@"Color"];
    a3ClassDay.dayID = [NSString stringWithFormat:@"DAY003"];
    tempClassDay = [NSString stringWithFormat:@"2014-04-24"];
    a3ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a3ClassDay.forClass = self.activeClass;
     
    ClassDay *a4ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a4ClassDay.name = [NSString stringWithFormat:@"Papel"];
    a4ClassDay.dayID = [NSString stringWithFormat:@"DAY004"];
    tempClassDay = [NSString stringWithFormat:@"2014-05-04"];
    a4ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a4ClassDay.forClass = self.activeClass;
     
    ClassDay *a5ClassDay = [NSEntityDescription
                            insertNewObjectForEntityForName:@"ClassDay"
                            inManagedObjectContext:self.activeClass.managedObjectContext];
    a5ClassDay.name = [NSString stringWithFormat:@"Ejemplo"];
    a5ClassDay.dayID = [NSString stringWithFormat:@"DAY005"];
    tempClassDay = [NSString stringWithFormat:@"2014-05-04"];
    a5ClassDay.date = [aDateFormatter dateFromString:tempClassDay];
    a5ClassDay.forClass = self.activeClass;
    
    
    
    NSError *NuError;
    if (![self.activeClass.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
     
    
    

    // TESTING ONLY AREA ENDS HERE ------------------------------------------------------
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
        if (!self.currentDayIndex) {
            self.currentDayIndex = 0;
        }
        
        NSArray *sortedDays = [self.activeClass getDaysSorted];
        ClassDay *currentDay = [sortedDays objectAtIndex:self.currentDayIndex];
        
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
