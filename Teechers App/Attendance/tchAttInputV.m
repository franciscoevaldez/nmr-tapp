//
//  tchAttInputV.m
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttInputV.h"

#import "tchStoreCoordinator.h"

#import "AClass+tchAClassExt.h"
#import "AttendanceRecord+tchAttExt.h"

@interface tchAttInputV ()

@property (strong,nonatomic) Student *activeStudent;
@property (nonatomic) NSInteger activeColumn;
@property (strong,nonatomic) IBOutlet tchStoreCoordinator *storeCoordinator;
@property (strong,nonatomic) IBOutlet UIImageView *excusedCheck;

@end

@implementation tchAttInputV


- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex
{
        
    // get the passed student to the view
    self.activeStudent = student;
    
    // get the passed column to this view
    self.activeColumn = columnIndex;
    
    // mark the checked (or not) -----
    // set default for no
    BOOL isExcused = FALSE;
    // and uncheck
    self.excusedCheck.image = [UIImage imageNamed:@"input check unchecked"];
    
    // get if a record exists
    AttendanceRecord *existingRecord = [self.activeStudent getAttendanceRecordForIndex:columnIndex];
    
    // if the record exists…
    if (existingRecord) {
        
        // …pass the excused to a variable
        isExcused = [existingRecord.excused boolValue];
        
        // and if the excused is true…
        if (isExcused) {
            
            // change the image of the check
            self.excusedCheck.image = [UIImage imageNamed:@"input check checked"];
            
        }
        
        
    }
    
    
}


- (void)updateActiveColumn:(NSInteger)columnIndex
{
    
    NSLog(@"change column");
    
    self.activeColumn = columnIndex;
    
}


- (IBAction)presentPressed:(id)sender
{
    
    // call method for saving record
    [self saveRecordWithStatus:tchAttendanceRecPresent];
    
    // tell the cell to dismiss the input
    [_delegate inputShouldDismiss];
    
}

- (IBAction)absentPressed:(id)sender
{
    
    // call method for saving record
    [self saveRecordWithStatus:tchAttendanceRecAbsent];
    
    // tell the cell to dismiss the input
    [_delegate inputShouldDismiss];
    
}


- (IBAction)excusedPressed:(id)sender
{
    
    // call method for toggling excused
    BOOL isExcused = [self toggleExcused];
    
    // change the is excused image
    if (isExcused) {
        self.excusedCheck.image = [UIImage imageNamed:@"input check checked"];
    } else {
        self.excusedCheck.image = [UIImage imageNamed:@"input check unchecked"];
    }
    
}


- (IBAction)latePressed:(id)sender
{
    
    // call method for saving record
    [self saveRecordWithStatus:tchAttendanceRecLate];
    
    // tell the cell to dismiss the input
    [_delegate inputShouldDismiss];
    
}

- (void)saveRecordWithStatus:(NSString*)newStatus
{
    
    // get the active class
    AClass* activeClass = self.activeStudent.inClass;
    
    // get the active day from active index
    ClassDay* activeDay = [activeClass getDayForIndex:self.activeColumn];
    
    // tell the store coordinator to save as present
    [self.storeCoordinator createAttendanceRecordForStudent:self.activeStudent
                                                      atDay:activeDay
                                                 withStatus:newStatus
                                              andOrderIndex:self.activeColumn];
    
}

- (BOOL)toggleExcused
{
    
    // get the active class
    AClass* activeClass = self.activeStudent.inClass;
    
    // get the active day from active index
    ClassDay* activeDay = [activeClass getDayForIndex:self.activeColumn];
    
    // tell the store coordinator to toggle excused for this student and day
    BOOL newExcused = [self.storeCoordinator toggleExcusedForStudent:self.activeStudent
                                                               atDay:activeDay
                                                           withIndex:self.activeColumn];
    
    // return the new excused value
    return newExcused;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
