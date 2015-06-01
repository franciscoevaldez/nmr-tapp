//
//  tchStudentsTableDataSource.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableDataSource.h"
#import "tchStudentsTableView.h"

#import "tchAStudentCell.h"

#import "Student+tchStudentsExt.h"

@interface tchStudentsTableDataSource()

@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) NSArray *studentsArray;

@end

@implementation tchStudentsTableDataSource

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    // pass the class to a local property
    self.activeClass = activeClass;
    
    // get the students into an array
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[activeClass.students allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *studentsSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    // sort the array
    [tempArray sortUsingDescriptors:[NSArray arrayWithObject:studentsSortDescr]];
    
    // pass the array to the data source class
    self.studentsArray = tempArray;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(tchStudentsTableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Number of rows is the number of classes in the array
    return [self.studentsArray count];
    
}

- (UITableViewCell *)tableView:(tchStudentsTableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // create the new cell
    tchAStudentCell *newCell = [[tchAStudentCell alloc] init];
    
    // if there is a cell deployed and is this one…
    if (tableView.thereIsACellDeployed && tableView.deployedPath.row == indexPath.row) {
        
        // dequeue it as cell with input…
        newCell = [tableView dequeueReusableCellWithIdentifier:@"studentCellWithInput"];
        //newCell = [tableView dequeueReusableCellWithIdentifier:@"studentCellWithData"];
        
    } else {
        
        // …otherwise dequeue it as a regular one
        newCell = [tableView dequeueReusableCellWithIdentifier:@"studentCellWithData"];
        
    }
    
    // get the student for this new cell
    Student *currentStudent = [self.studentsArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForStudent:currentStudent
                   atScrollIndex:self.currentScrollIndex
                   withIndexPath:indexPath
                     andDelegate:tableView];
    
    // return the cell
    return newCell;
    
}


@end
