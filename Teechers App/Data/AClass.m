//
//  AClass.m
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "AClass.h"
#import "ClassDay.h"
#import "Evaluation.h"
#import "Student.h"

@implementation AClass

// Insert code here to add functionality to your managed object subclass

#pragma mark - Class creation
- (void)createAndStoreClassWithName:(NSString*)name
                        institution:(NSString*)institution
                        andStudents:(NSArray*)students
{
    
    // add the name attribute
    [self setValue:name forKey:@"name"];
    
    // add the institution attribute
    [self setValue:institution forKey:@"institution"];
    
    // save in store
    NSError *NuError;
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
    
    // loop for every student
    for (int stInd=0; stInd<[students count]; stInd++) {
        
        // create a new student object
        Student *aNewStudent = [NSEntityDescription
                                insertNewObjectForEntityForName:@"Student"
                                inManagedObjectContext:self.managedObjectContext];
        
        // add the name attribute
        [aNewStudent setValue:[students objectAtIndex:stInd] forKey:@"name"];
        
        // associate it to the class being created
        [aNewStudent setValue:self forKey:@"inClass"];
        
        
    }
    
    // save all the students in store
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
}

#pragma mark - Class settings
- (void)changeClassName:(NSString*)newName
{
    
    if (newName) {
        [self setValue:newName forKey:@"name"];
    }
    
    // save the new name
    NSError *NuError;
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
}

#pragma mark - Student creation
- (void)createStudentWithName:(NSString*)studentName
{
    
    // create the new student object
    Student *newStudent = [NSEntityDescription
                           insertNewObjectForEntityForName:@"Student"
                           inManagedObjectContext:self.managedObjectContext];
    
    // add the name attribute
    [newStudent setValue:studentName forKey:@"name"];
    
    // associate it with the passed class
    [newStudent setValue:self forKey:@"inClass"];
    
    // save in store
    NSError *NuError;
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
}

#pragma mark - Day handling

// return the day array sorted
- (NSArray*)getDaysSorted
{
    
    // get the days into an array
    NSMutableArray *daysArray = [NSMutableArray arrayWithArray:[self.classDays allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *studentsSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    // sort the array
    [daysArray sortUsingDescriptors:[NSArray arrayWithObject:studentsSortDescr]];
    
    // mutable to array
    NSArray *returnArray = [NSArray arrayWithArray:daysArray];
    
    // return the array
    return returnArray;
    
}

// return sort index for date
- (NSInteger)getSortIndexForDay:(ClassDay*)classDay
{
    
    // get sorted array
    NSArray *sortedArray = [self getDaysSorted];
    NSInteger returnIndex = [sortedArray count]-1;
    
    // loop looking for the passed day
    for (int i=0; i < [sortedArray count]; i++) {
        
        // get looped day
        ClassDay *currentCD = [sortedArray objectAtIndex:i];
        
        // check coincidence
        if (currentCD == classDay) {
            
            // pass the index into a var
            returnIndex = i;
            
        }
        
    }
    
    //return the index
    return returnIndex;
}

// get the day for the index passed
- (ClassDay*)getDayForIndex:(NSInteger)index
{
    
    // get the sorted days array
    NSArray *sortedArray = [self getDaysSorted];
    
    // get the day for the index
    ClassDay *returnDay = [sortedArray objectAtIndex:index];
    
    // return it
    return returnDay;
    
}

#pragma mark - Class Day Handling
// method for storing a new class day
- (ClassDay*)createNewDay:(NSDate*)date withName:(NSString*)name
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // create the day object
    ClassDay *newClassDay = [NSEntityDescription
                             insertNewObjectForEntityForName:@"ClassDay"
                             inManagedObjectContext:managedOC];
    
    // set the date for the new day
    [newClassDay setValue:date forKey:@"date"];
    
    // set the name for the new day
    [newClassDay setValue:name forKey:@"name"];
    
    // set the class for the new day
    [newClassDay setValue:self forKey:@"forClass"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"Unresolved error %@, %@, %@", dayError, [dayError userInfo],[dayError localizedDescription]);
    }
    
    // return the created day
    return newClassDay;
    
}

#pragma mark - Evaluations handling
// return the day array sorted
- (NSArray*)getEvaluationsSorted
{
    
    // get the days into an array
    NSMutableArray *evaluationsArray = [NSMutableArray arrayWithArray:[self.evaluations allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *studentsSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    // sort the array
    [evaluationsArray sortUsingDescriptors:[NSArray arrayWithObject:studentsSortDescr]];
    
    // mutable to array
    NSArray *returnArray = [NSArray arrayWithArray:evaluationsArray];
    
    // return the array
    return returnArray;
    
}

// get the day for the index passed
- (Evaluation*)getEvaluationForIndex:(NSInteger)index
{
    
    // get the sorted days array
    NSArray *sortedArray = [self getEvaluationsSorted];
    
    // get the day for the index
    Evaluation *returnEvaluation = [sortedArray objectAtIndex:index];
    
    // return it
    return returnEvaluation;
    
}

#pragma mark - Evaluations Handling
- (Evaluation*)createAndStoreNewEvaluation:(NSString*)name
                                    withID:(NSString*)newID
                                  maxGrade:(NSInteger)maxGrade
                                      date:(NSDate*)date
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // create the evaluation object
    Evaluation *newEvaluation = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Evaluation"
                                 inManagedObjectContext:managedOC];
    
    
    // set the ID for the new evaluation
    //[newEvaluation setValue:newID forKey:@"gradeID"];
    [newEvaluation setValue:newID forKey:@"nameShort"];
    
    // set the name for the new evaluation
    [newEvaluation setValue:name forKey:@"name"];
    
    // set the max grade for the new evaluation
    [newEvaluation setValue:[NSNumber numberWithInteger:maxGrade] forKey:@"range"];
    
    // set the type for the new evaluation (number for now)
    [newEvaluation setValue:[NSString stringWithFormat:@"number"] forKey:@"type"];
    
    // set the date for the new evaluation
    [newEvaluation setValue:date forKey:@"date"];
    
    // set the class for the new day
    [newEvaluation setValue:self forKey:@"forClass"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return newEvaluation;
    
}

@end
