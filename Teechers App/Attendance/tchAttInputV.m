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

@end

@implementation tchAttInputV


- (void)setupForStudent:(Student*)student
{
    
    // get the passed student to the view
    self.activeStudent = student;
    
}


- (void)updateActiveColumn:(NSInteger)columnIndex
{
    
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
    
    NSLog(@"excused for student: %@ :: day: %i", self.activeStudent.name, self.activeColumn);
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
