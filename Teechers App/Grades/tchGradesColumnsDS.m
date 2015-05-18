//
//  tchGradesColumnsDS.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesColumnsDS.h"
#import "tchColumnsCollection.h"

@interface tchGradesColumnsDS ()

@property (strong,nonatomic) NSArray *daysArray;

@end

@implementation tchGradesColumnsDS

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
    return dayCount;
    
}


- (UICollectionViewCell *)collectionView:(tchColumnsCollection *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *newCell = [collectionView
                                     dequeueReusableCellWithReuseIdentifier:@"studentDataCell"
                                     forIndexPath:indexPath];
    
    /*
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
     */
    
    // return the cell
    return newCell;
    
}


@end
