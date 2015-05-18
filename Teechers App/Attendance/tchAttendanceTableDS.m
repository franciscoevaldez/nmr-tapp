//
//  tchAttendanceTableDS.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceTableDS.h"

#import "Student.h"
#import "tchStudentDataTVC.h"
#import "tchAttendanceTableV.h"

@interface tchAttendanceTableDS ()

@property (strong,nonatomic) NSArray *studentsArray;

@end

@implementation tchAttendanceTableDS

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
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

- (NSInteger)tableView:(tchAttendanceTableV *)tableView numberOfRowsInSection:(NSInteger)section {
        
    // Number of rows is the number of classes in the array
    return [self.studentsArray count];
    
}


- (UITableViewCell *)tableView:(tchAttendanceTableV*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // create the new cell
    tchStudentDataTVC *newCell = [[tchStudentDataTVC alloc] init];
    
    if (tableView.thereIsSelection && tableView.selectedPath.row == indexPath.row) {
        
        newCell = [tableView dequeueReusableCellWithIdentifier:@"studentCellWithInput"];
        
    } else {
        
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
