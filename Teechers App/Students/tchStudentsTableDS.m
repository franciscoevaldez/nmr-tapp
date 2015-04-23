//
//  tchStudentsTableDS.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableDS.h"
#import "Student.h"

#import "tchStudentDeployableTVC.h"

@interface tchStudentsTableDS ()

@property (strong,nonatomic) NSArray *studentsArray;

@end

@implementation tchStudentsTableDS

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    // get the students into an array
    NSMutableArray *unsortedArray = [NSMutableArray arrayWithArray:[activeClass.students allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *studentsSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    // sort the array
    [unsortedArray sortUsingDescriptors:[NSArray arrayWithObject:studentsSortDescr]];
    
    // pass the array to the data source class
    self.studentsArray = unsortedArray;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Number of rows is the number of classes in the array
    return [self.studentsArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // create the new cell
    tchStudentDeployableTVC *newCell = [tableView dequeueReusableCellWithIdentifier:@"studentPlainCell"];
    
    // get the student for this new cell
    Student *currentStudent = [self.studentsArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForStudent:currentStudent];
    
    // return the cell
    return newCell;
    
}

@end
