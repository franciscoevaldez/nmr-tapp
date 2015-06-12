//
//  tchStudentSummaryTable.m
//  Teechers App
//
//  Created by fran on 7/6/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentSummaryTable.h"
#import "tchStudentSummaryDataSource.h"

@implementation tchStudentSummaryTable

- (void)setupForStudent:(Student*)student{
    
    // get the student to a property
    self.activeStudent = student;
    
    // cast the table
    tchStudentSummaryDataSource *dataSource = self.dataSource;
    
    // pass the student to the data source
    [dataSource setupForStudent:student];
    
    /*
     // get the student to a property
     self.activeStudent = student;
     
     // cast the data source
     tchColumnCollectionDataSource *dataSource = self.dataSource;
     
     // pass the student to the data source
     [dataSource setupForStudent:student];
     
     // scroll to the column index
     [self skipColumnToIndex:columnIndex];
     */
    
}

@end
