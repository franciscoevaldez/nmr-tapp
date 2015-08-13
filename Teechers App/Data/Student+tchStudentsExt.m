//
//  Student+tchStudentsExt.m
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "Student+tchStudentsExt.h"

@implementation Student (tchStudentsExt)

#pragma mark - Attendance handling
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

- (AttendanceRecord*)getAttendanceRecordForIndex:(NSInteger)dayIndex
{
    
    // get the class for this student
    AClass *myClass = self.inClass;
    
    // get the day for the index
    ClassDay *classDay = [myClass getDayForIndex:dayIndex];
    
    // get the record for this day
    AttendanceRecord *record = [self getAttendanceRecordForDay:classDay];
    
    // return it
    return record;
    
}

#pragma mark - Attendance Record Handling
// create or update an attendance record
- (void)createAttendanceRecordAtDay:(ClassDay*)classDay
                         withStatus:(tchAttendanceStatus)status
                      andOrderIndex:(NSInteger)index
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = classDay.managedObjectContext;
    
    // create object of record
    AttendanceRecord *recordToSave;
    
    // get a previous record
    //AttendanceRecord *prevRecord = [self getRecordForStudent:student andDay:classDay];
    AttendanceRecord *prevRecord = [self getAttendanceRecordForDay:classDay];
    
    // if that previous record exists, use it, otherwise create a new one
    if (prevRecord) {
        
        recordToSave = prevRecord;
        
    } else {
        
        recordToSave = [NSEntityDescription
                        insertNewObjectForEntityForName:@"AttendanceRecord"
                        inManagedObjectContext:managedOC];
        
    }
    
    
    // set the value
    [recordToSave setValue:[NSNumber numberWithInteger:status] forKey:@"status"];
    
    // set the order index
    [recordToSave setValue:[NSNumber numberWithInteger:index] forKey:@"orderIndex"];
    
    // set excused to false
    [recordToSave setValue:[NSNumber numberWithBool:tchAttendanceExcusedNo] forKey:@"excused"];
    
    // set the day of the class
    [recordToSave setValue:classDay forKey:@"classDay"];
    
    // set the student it belongs to
    [recordToSave setValue:self forKey:@"student"];
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
    // update the summary
    [self updateSummary];
    
    
}

- (BOOL)toggleExcusedAtDay:(ClassDay*)classDay withIndex:(NSInteger)dayIndex
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = classDay.managedObjectContext;
    
    // create reference to editable record
    AttendanceRecord *recordToEdit;
    
    // and to the excused status;
    BOOL isExcused = FALSE;
    
    // get if a record for this day already exists
    //AttendanceRecord *previousRecord = [self getRecordForStudent:student andDay:classDay];
    AttendanceRecord *previousRecord = [self getAttendanceRecordForDay:classDay];
    
    // if it does, get the excused status
    if (previousRecord) {
        
        recordToEdit = previousRecord;
        isExcused = [recordToEdit.excused boolValue];
        
    } else {
        
        // if it doesn't, create it
        recordToEdit = [NSEntityDescription
                        insertNewObjectForEntityForName:@"AttendanceRecord"
                        inManagedObjectContext:managedOC];
        
        // set the value
        [recordToEdit setValue:[NSString stringWithFormat:@"%li", (long)tchAttendanceAbsent] forKey:@"status"];
        
        // set the order index
        [recordToEdit setValue:[NSNumber numberWithInteger:dayIndex] forKey:@"orderIndex"];
        
        // set the day of the class
        [recordToEdit setValue:classDay forKey:@"classDay"];
        
        // set the student it belongs to
        [recordToEdit setValue:self forKey:@"student"];
        
        
    }
    
    // invert the excused status
    isExcused = !isExcused;
    
    // set the new status to the record
    recordToEdit.excused = [NSNumber numberWithBool:isExcused];
    
    // save the record to the permanent store
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
    // update the summary
    [self updateSummary];
    
    // return the new value
    return isExcused;
    
}

#pragma mark - Grade handling
- (GradeRecord*)getGradeForEvaluation:(Evaluation*)evaluation
{
    
    // initialize
    GradeRecord *returnRecord = nil;
    
    // get the array of attendance records
    NSArray *recordsArray = [self.gradeRecords allObjects];
    
    // loop through all of them
    for (int i=0; i<[recordsArray count]; i++) {
        
        // current record
        GradeRecord *currentRecord = [recordsArray objectAtIndex:i];
        
        // check coincidence
        if (currentRecord.forClass == evaluation) {
            
            // store coincidence
            returnRecord = currentRecord;
            
        }
        
        
    }
    
    return returnRecord;
    
}

#pragma mark - Grade Record Handling
// create or update an attendance record
- (void)setGradeRecordForEvaluation:(Evaluation*)evaluation
                          withGrade:(NSInteger*)grade
                      andOrderIndex:(NSInteger)index
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // create object of record
    GradeRecord *recordToSave;
    
    // get if there is a previous record
    GradeRecord *prevRecord = [self getGradeForEvaluation:evaluation];
    
    // if there is a previous record, use it
    if (prevRecord) {
        
        recordToSave = prevRecord;
        
    } else {
        
        // otherwise, create it
        
        recordToSave = [NSEntityDescription
                        insertNewObjectForEntityForName:@"GradeRecord"
                        inManagedObjectContext:managedOC];
        
        // set the class (evaluation) it belongs to
        [recordToSave setValue:evaluation forKey:@"forClass"];
        
        // set the student it belongs to
        [recordToSave setValue:self forKey:@"forStudent"];
        
    }
    
    
    // prepare the grades as texts
    NSString *gradeAsText = [NSString stringWithFormat:@"%ld", (long)grade];
    
    // prepare the percentage
    NSInteger gradeInt = *grade;
    NSInteger rangeInt = [evaluation.range integerValue];
    //NSNumber *gradePct = [NSNumber numberWithFloat: gradeInt / rangeInt];
    float gradePctF = (float)gradeInt / (float)rangeInt;
    NSNumber *gradePct = [NSNumber numberWithFloat:gradePctF];
    
    // set the value
    [recordToSave setValue:[NSNumber numberWithInteger:gradeInt] forKey:@"grade"];
    [recordToSave setValue:gradeAsText forKey:@"gradeLong"];
    [recordToSave setValue:gradeAsText forKey:@"gradeShort"];
    
    // set the order index
    [recordToSave setValue:[NSNumber numberWithInteger:index] forKey:@"orderIndex"];
    
    // set the percentage
    [recordToSave setValue:gradePct forKey:@"percentage"];
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
    // update the summary
    [self updateSummary];
    
    
}

#pragma mark - Summary updating
- (void)updateSummary{
    
    // initialize the summary to edit
    StudentSummary *summary;
    
    // check if the student has a summary...
    if (self.summaryRecord) {
        
        // ... if it does, set it as the current one
        summary = self.summaryRecord;
        
    } else {
        
        // ... otherwise create it
        summary = [NSEntityDescription
                   insertNewObjectForEntityForName:@"StudentSummary"
                   inManagedObjectContext:self.managedObjectContext];
        
        // set the student to self
        [summary setValue:self forKey:@"forStudent"];
        
    }
    
    // now commence the calculations for attendance
    int studentAbsentCount = 0;
    int studentLateCount = 0;
    int studentTotalCount = 0;
    float studentAttPercentage = 0;
    int studentAttWarning = 0;
    
    // get the attendance records
    NSArray *attendanceRecords = [self.attendanceRecords allObjects];
    
    // loop and count attendance records
    for (AttendanceRecord *anAttRecord in attendanceRecords) {
        
        studentTotalCount++;
        
        if ([anAttRecord.status isEqual:[NSString stringWithFormat:@"%li", (long)tchAttendanceAbsent]]) {
            
            if ([anAttRecord.excused integerValue] != tchAttendanceExcusedYes) {
                studentAbsentCount++;
            };
            
        } else if ([anAttRecord.status isEqual:[NSString stringWithFormat:@"%li", (long)tchAttendanceLate]]){

            if ([anAttRecord.excused integerValue] != tchAttendanceExcusedYes) {
                studentLateCount++;
            };
            
        } else if ([anAttRecord.status isEqual:[NSString stringWithFormat:@"%li", (long)tchAttendancePresent]]){

        }
        
    }
    
    // get the percentages & warnings
    if (studentTotalCount != 0) {
        studentAttPercentage = 1-((float)studentAbsentCount/(float)studentTotalCount);
    }
    
    studentAttWarning = 0;
    
    // store the attendance data
    [summary setValue:[NSNumber numberWithInt:studentAbsentCount] forKey:@"attAbsents"];
    [summary setValue:[NSNumber numberWithInt:studentLateCount] forKey:@"attLates"];
    [summary setValue:[NSNumber numberWithFloat:studentAttPercentage] forKey:@"attPercentage"];
    [summary setValue:[NSNumber numberWithInt:studentTotalCount] forKey:@"attTotal"];
    [summary setValue:[NSNumber numberWithInt:studentAttWarning] forKey:@"attWarning"];
    
    
    // get the grade records ------------
    NSArray *gradesRecords = [self.gradeRecords allObjects];
    
    
    // now commence the calculations for attendance
    int gradesFailedCount = 0;      // leave at 0 for now
    int gradesPassedCount = 0;      // leave at 0 for now
    int gradesTotalCount = 0;       // add 1 for every record
    float gradesPct = 0;            // average for every individual pct
    int gradesWarning = 0;          // leave at 0 for now
    
    // init the grade accumulator
    float gradeAcc = 0;
    
    // loop and count attendance records
    for (GradeRecord *aGradeRecord in gradesRecords) {
        
        gradesTotalCount++;
        
        // get the percentage for this grade record
        float currentPct = [aGradeRecord.percentage floatValue];
        
        // add to the accumulator
        gradeAcc = gradeAcc+currentPct;
        
    }
    
    // get the average
    gradesPct = gradeAcc / gradesTotalCount;
    
    // store the grades data
    [summary setValue:[NSNumber numberWithInt:gradesFailedCount] forKey:@"grdFailed"];
    [summary setValue:[NSNumber numberWithInt:gradesPassedCount] forKey:@"grdPassed"];
    [summary setValue:[NSNumber numberWithFloat:gradesPct] forKey:@"grdPercentage"];
    [summary setValue:[NSNumber numberWithInt:gradesTotalCount] forKey:@"grdTotal"];
    [summary setValue:[NSNumber numberWithInt:gradesWarning] forKey:@"grdWarning"];
    
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![self.managedObjectContext save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
    
}



@end
