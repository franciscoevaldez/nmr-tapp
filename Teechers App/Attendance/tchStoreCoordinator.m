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


#pragma mark - Attendance Record Handling
// create or update an attendance record
- (void)createAttendanceRecordForStudent:(Student*)student
                                   atDay:(ClassDay*)classDay
                              withStatus:(NSString*)status
                           andOrderIndex:(NSInteger)index
{
    
    // check if a record already exists
    
    // if record doesnt exist
    // get the managed object context
    NSManagedObjectContext *managedOC = student.managedObjectContext;
    
    // create the day object
    AttendanceRecord *newRecord = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"AttendanceRecord"
                                   inManagedObjectContext:managedOC];
    
    
    // set the value
    [newRecord setValue:status forKey:@"status"];
    
    // set the order index
    [newRecord setValue:[NSNumber numberWithInt:index] forKey:@"orderIndex"];
    
    // set excused to false
    [newRecord setValue:[NSNumber numberWithBool:tchAttendanceRecExcusedNO] forKey:@"excused"];
    
    // set the day of the class
    [newRecord setValue:classDay forKey:@"classDay"];
    
    // set the student it belongs to
    [newRecord setValue:student forKey:@"student"];
    
    
    // write in permanent store
    
    NSError *recordError;
    if (![managedOC save:&recordError]) {
        NSLog(@"error en: %@", [recordError localizedDescription]);
    }
    
        
}


/*
 @property (nonatomic, retain) NSNumber * excused;
 @property (nonatomic, retain) NSNumber * orderIndex;
 @property (nonatomic, retain) NSString * status;
 @property (nonatomic, retain) ClassDay *classDay;
 @property (nonatomic, retain) Student *student;
 */


@end
