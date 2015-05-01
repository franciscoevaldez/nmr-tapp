//
//  tchStoreCoordinator.m
//  Teechers App
//
//  Created by fran on 29/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStoreCoordinator.h"

#import "ClassDay.h"

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



@end
