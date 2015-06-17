//
//  tchAttendanceColumnsDS.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceColumnsDS.h"
#import "tchColumnsCollection.h"

#import "tchAttendanceColumnVC.h"

#import "AttendanceRecord+tchAttExt.h"

@interface tchAttendanceColumnsDS ()

@property (strong,nonatomic) NSArray *daysArray;

@end

@implementation tchAttendanceColumnsDS


- (void)setupForStudent:(Student*)activeStudent{
    
    // pasar el estudiante a la celda
    self.activeStudent = activeStudent;
    
}


- (NSInteger)collectionView:(tchColumnsCollection *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    // get the sorted days array into the cell
    self.daysArray = [self.activeStudent.inClass getDaysSorted];
    
    // get amount of days
    NSInteger dayCount = [[self.activeStudent.inClass.classDays allObjects] count];
    
    // Number of rows is the number of days in the array
    if (dayCount==0) {
        return 1;
    }
    
    return dayCount;
    
}


- (UICollectionViewCell *)collectionView:(tchColumnsCollection *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    tchAttendanceColumnVC *newCell = [collectionView
                                      dequeueReusableCellWithReuseIdentifier:@"studentDataCell"
                                      forIndexPath:indexPath];
    
    NSInteger dayCount = [[self.activeStudent.inClass.classDays allObjects] count];
    
    if (dayCount == 0) {
        return newCell;
    }
    
    // get the current day
    ClassDay *currentDay = [self.daysArray objectAtIndex:indexPath.row];
    
    // get the current student
    Student *currentStudent = collectionView.activeStudent;
     
    // look for the record belonging to that day
    AttendanceRecord* currentRecord = [currentStudent getAttendanceRecordForDay:currentDay];
     
    // tell the cell to configure itself for that record
    [newCell setupForRecord:currentRecord orDate:currentDay];
    
    // return the cell
    return newCell;
    
}

@end
