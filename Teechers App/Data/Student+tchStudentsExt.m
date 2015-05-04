//
//  Student+tchStudentsExt.m
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "Student+tchStudentsExt.h"

@implementation Student (tchStudentsExt)

// get the attendance record for that day
- (AttendanceRecord*)getAttendanceRecordForDay:(ClassDay*)classday
{
    
    // initialize
    AttendanceRecord *returnRecord = nil;
    
    // get the array of attendance records
    NSArray *recordsArray = [self.attendanceRecords allObjects];
    
    // loop through all of them
    for (int i=0; i<[recordsArray count]; i++) {
        
        // current record
        AttendanceRecord *currentRecord = [recordsArray objectAtIndex:i];
        
        // check coincidence
        if (currentRecord.classDay == classday) {
            
            // store coincidence
            returnRecord = currentRecord;
            
        }
    
        
    }
    
    return returnRecord;
    
}

@end
