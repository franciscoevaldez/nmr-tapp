//
//  tchAttInputV.m
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttInputV.h"

#import "AClass+tchAClassExt.h"
#import "AttendanceRecord+tchAttExt.h"

@interface tchAttInputV ()

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

- (void)setupDelegate:(id)delegate
{
    self.myDelegate = delegate;
}

- (void)updateActiveColumn:(NSInteger)columnIndex
{
    
    self.activeColumn = columnIndex;
    
}


- (IBAction)presentPressed:(id)sender
{
    
    // call method for saving record
    [self saveRecordWithStatus:tchAttendancePresent];
    
    // tell the cell to dismiss the input
    [_myDelegate cellShouldDismiss];
    
}

- (IBAction)absentPressed:(id)sender
{
    
    // call method for saving record
    [self saveRecordWithStatus:tchAttendanceAbsent];
    
    // tell the cell to dismiss the input
    [_myDelegate cellShouldDismiss];
    
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
    [self saveRecordWithStatus:tchAttendanceLate];
    
    // tell the cell to dismiss the input
    [_myDelegate cellShouldDismiss];
    
}

- (void)saveRecordWithStatus:(NSInteger)newStatus
{
    
    // status to string (HOT FIX!!!!!)
    NSString *statusToSave = [NSString stringWithFormat:@"%li", (long)newStatus];
    
    // get the active class
    AClass* activeClass = self.activeStudent.inClass;
    
    // get the active day from active index
    ClassDay* activeDay = [activeClass getDayForIndex:self.activeColumn];
    
    // create a new record for the active student
    [self.activeStudent createAttendanceRecordAtDay:activeDay
                                         withStatus:statusToSave
                                      andOrderIndex:self.activeColumn];
    
}

- (BOOL)toggleExcused
{
    
    // get the active class
    AClass* activeClass = self.activeStudent.inClass;
    
    // get the active day from active index
    ClassDay* activeDay = [activeClass getDayForIndex:self.activeColumn];
    
    // tell the student to toggle excused for that record
    BOOL newExcused = [self.activeStudent toggleExcusedAtDay:activeDay withIndex:self.activeColumn];
    
    
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
