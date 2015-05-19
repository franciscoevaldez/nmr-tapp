//
//  tchColumnsCollection.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnsCollection.h"
#import "tchColumnCollectionDataSource.h"

@interface tchColumnsCollection ()



@end

@implementation tchColumnsCollection

#pragma mark - Setting up for a student
- (void)setupForStudent:(Student*)student{
    
    // get the student to a property
    self.activeStudent = student;
    
    // cast the data source
    tchColumnCollectionDataSource *dataSource = self.dataSource;
    
    // pass the student to the data source
    [dataSource setupForStudent:student];
    
}



@end
