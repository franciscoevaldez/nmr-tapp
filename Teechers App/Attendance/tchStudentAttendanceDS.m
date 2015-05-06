//
//  tchStudentAttendanceDS.m
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentAttendanceDS.h"
#import "tchAttendanceColumnVC.h"
#import "tchCollectionIndexed.h"

@interface tchStudentAttendanceDS ()

@property (strong,nonatomic) NSArray *daysArray;

@end

@implementation tchStudentAttendanceDS

- (void)setupForStudent:(Student*)activeStudent{
    
    // pasar el estudiante a la celda
    self.activeStudent = activeStudent;
        
}


- (NSInteger)collectionView:(tchCollectionIndexed *)collectionView numberOfItemsInSection:(NSInteger)section{
        
    // get amount of days
    NSInteger dayCount = [[collectionView.student.inClass.classDays allObjects] count];
    
    // get the sorted days array into the cell
    self.daysArray = [self.activeStudent.inClass getDaysSorted];
    
    // Number of rows is the number of days in the array
    return dayCount;
    
}


- (UICollectionViewCell *)collectionView:(tchCollectionIndexed *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    tchAttendanceColumnVC *newCell = [collectionView
                                     dequeueReusableCellWithReuseIdentifier:@"studentDataCell"
                                     forIndexPath:indexPath];
    
    // get the current day
    ClassDay *currentDay = [self.daysArray objectAtIndex:indexPath.row];
    
    // look for the record belonging to that day
    AttendanceRecord* currentRecord = [collectionView.student getAttendanceRecordForDay:currentDay];
    
    // tell the cell to configure itself for that record
    [newCell setupForRecord:currentRecord orDate:currentDay];
    
    //[newCell tempSetup:indexPath.row];
    
    // return the cell
    return newCell;
    
}

@end
