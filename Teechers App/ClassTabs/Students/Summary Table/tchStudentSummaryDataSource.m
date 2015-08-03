//
//  tchStudentSummaryDataSource.m
//  Teechers App
//
//  Created by fran on 7/6/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentSummaryDataSource.h"
#import "tchStudentSummaryDataCell.h"

@interface tchStudentSummaryDataSource ()

@property (strong,nonatomic) NSArray* attRecArray;
@property (strong,nonatomic) NSArray* gradeRecArray;

@end

@implementation tchStudentSummaryDataSource

- (void)setupForStudent:(Student*)student{
    
    // pass the recieved evaluation to the property
    self.activeStudent = student;
    
    self.attRecArray = [self.activeStudent.attendanceRecords allObjects];
    self.gradeRecArray = [self.activeStudent.gradeRecords allObjects];
    
};

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section==0) {
        return [self.attRecArray count]+1;
    }
    
    if (section==1) {
        return [self.gradeRecArray count]+1;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tchStudentSummaryDataCell *cell;
    
    // get the current row, if it is 1...
    if (indexPath.row == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryHeaderCell"];
        
        NSString *content;
        
        if (indexPath.section == 0) {
            content = @"Attendance";
        }
        
        if (indexPath.section == 1) {
            content = @"Grades";
        }
        
        [cell setupCellForData:self.activeStudent.summaryRecord atIndexPath:indexPath];
        
        
    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryDetailCell"];
        
        if (indexPath.section == 0) {
            
            AttendanceRecord *currentRecord = [self.attRecArray objectAtIndex:indexPath.row-1];
            
            [cell setupCellForData:currentRecord atIndexPath:indexPath];
            
        }
        
        if (indexPath.section == 1) {
            
            GradeRecord *currentRecord = [self.gradeRecArray objectAtIndex:indexPath.row-1];

            [cell setupCellForData:currentRecord atIndexPath:indexPath];
            
        }
        
        
        
    }
    
    
    return cell;
    
}



@end
