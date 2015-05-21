//
//  tchStoreCoordinator.m
//  Teechers App
//
//  Created by fran on 29/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStoreCoordinator.h"

#import "ClassDay.h"
#import "AttendanceRecord+tchAttExt.h"
#import "Evaluation.h"

@implementation tchStoreCoordinator


#pragma mark - Class Day Handling
// method for storing a new class day
- (ClassDay*)createAndStoreNewDay:(NSDate*)date withName:(NSString*)name
{
    
    // get the day ID
    
    // get the amount of existing days…
    NSInteger daysCount = [[self.activeClass.classDays allObjects] count];
    
    // get the classID
    NSString *classID = self.activeClass.classID;
    
    // …add one and create the DayID
    NSString *newDayID = [NSString stringWithFormat:@"%@%i", classID, daysCount];
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.activeClass.managedObjectContext;
    
    // create the day object
    ClassDay *newClassDay = [NSEntityDescription
                             insertNewObjectForEntityForName:@"ClassDay"
                             inManagedObjectContext:managedOC];
    
    
    // set the ID for the new day
    [newClassDay setValue:newDayID forKey:@"dayID"];
    
    // set the name for the new day
    [newClassDay setValue:date forKey:@"date"];
    
    // set the name for the new day
    [newClassDay setValue:name forKey:@"name"];
    
    // set the class for the new day
    [newClassDay setValue:self.activeClass forKey:@"forClass"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return newClassDay;
    
}


// method for updating a class day
- (ClassDay*)updateAndStoreDay:(ClassDay*)classDayToUpdate withDate:(NSDate*)date withName:(NSString*)name
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = classDayToUpdate.managedObjectContext;

    // set the name for the new day
    [classDayToUpdate setValue:date forKey:@"date"];
    
    // set the name for the new day
    [classDayToUpdate setValue:name forKey:@"name"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return classDayToUpdate;
    
}

// delete a class day
- (void)deleteClassDay:(ClassDay*)classDayToDelete
{
    
    // get managed object context
    NSManagedObjectContext *managedOC = classDayToDelete.managedObjectContext;
    
    // deleted the object
    [managedOC deleteObject:classDayToDelete];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    
}

- (AttendanceRecord*)getRecordForStudent:(Student*)student andDay:(ClassDay*)classDay{
    
    
    AttendanceRecord* resultRecord;
    
    // get the existing records in a new array
    NSArray* existingRecs = [student.attendanceRecords allObjects];
    
    for (AttendanceRecord* currentRec in existingRecs) {
        
        // check for coincidence
        if ([currentRec.classDay isEqual:classDay]) {
            
            // if they are, set the returning record to this one
            resultRecord = currentRec;
            
            // and exit the loop
            return resultRecord;
            
        }
        
    }
    
    return resultRecord;
    
}


#pragma mark - Attendance Record Handling
// create or update an attendance record
- (void)createAttendanceRecordForStudent:(Student*)student
                                   atDay:(ClassDay*)classDay
                              withStatus:(NSString*)status
                           andOrderIndex:(NSInteger)index
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = student.managedObjectContext;
    
    // create object of record
    AttendanceRecord *recordToSave;

    // get a previous record
    AttendanceRecord *prevRecord = [self getRecordForStudent:student andDay:classDay];
    
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
    [recordToSave setValue:[NSNumber numberWithBool:tchAttendanceRecExcusedNO] forKey:@"excused"];
    
    // set the day of the class
    [recordToSave setValue:classDay forKey:@"classDay"];
    
    // set the student it belongs to
    [recordToSave setValue:student forKey:@"student"];
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
        
}

- (BOOL)toggleExcusedForStudent:(Student*)student
                          atDay:(ClassDay*)classDay
                      withIndex:(NSInteger)dayIndex
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = student.managedObjectContext;
    
    // create reference to editable record
    AttendanceRecord *recordToEdit;
    
    // and to the excused status;
    BOOL isExcused = FALSE;
    
    // get if a record for this day already exists
    AttendanceRecord *previousRecord = [self getRecordForStudent:student andDay:classDay];
    
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
        [recordToEdit setValue:tchAttendanceRecAbsent forKey:@"status"];
        
        // set the order index
        [recordToEdit setValue:[NSNumber numberWithInt:dayIndex] forKey:@"orderIndex"];
        
        // set the day of the class
        [recordToEdit setValue:classDay forKey:@"classDay"];
        
        // set the student it belongs to
        [recordToEdit setValue:student forKey:@"student"];
        
        
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


#pragma mark - Evaluations Handling
- (Evaluation*)createAndStoreNewEvaluation:(NSString*)name
                                    withID:(NSString*)newID
                                  maxGrade:(int)maxGrade
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.activeClass.managedObjectContext;
    
    // create the evaluation object
    Evaluation *newEvaluation = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Evaluation"
                                 inManagedObjectContext:managedOC];
    
    
    // set the ID for the new day
    [newEvaluation setValue:name forKey:@"gradeID"];
    
    // set the name for the new day
    [newEvaluation setValue:[NSNumber numberWithInt:maxGrade] forKey:@"range"];
    
    // set the name for the new day
    [newEvaluation setValue:[NSString stringWithFormat:@"number"] forKey:@"type"];
    
    // set the class for the new day
    [newEvaluation setValue:self.activeClass forKey:@"forClass"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return newEvaluation;
    
}


@end
