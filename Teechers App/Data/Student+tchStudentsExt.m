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
                         withStatus:(NSString*)status
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
    [recordToSave setValue:status forKey:@"status"];
    
    // set the order index
    [recordToSave setValue:[NSNumber numberWithInt:index] forKey:@"orderIndex"];
    
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
        [recordToEdit setValue:[NSString stringWithFormat:@"%i", tchAttendanceAbsent] forKey:@"status"];
        
        // set the order index
        [recordToEdit setValue:[NSNumber numberWithInt:dayIndex] forKey:@"orderIndex"];
        
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
    NSNumber *gradePct = [NSNumber numberWithFloat: gradeInt / rangeInt];
    
    // set the value
    [recordToSave setValue:[NSNumber numberWithInteger:gradeInt] forKey:@"grade"];
    [recordToSave setValue:gradeAsText forKey:@"gradeLong"];
    [recordToSave setValue:gradeAsText forKey:@"gradeShort"];
    
    // set the order index
    [recordToSave setValue:[NSNumber numberWithInt:index] forKey:@"orderIndex"];
    
    // set the percentage
    [recordToSave setValue:gradePct forKey:@"percentage"];
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
    
}



@end
