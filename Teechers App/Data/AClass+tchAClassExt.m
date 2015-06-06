//
//  AClass+tchAClassExt.m
//  Teechers App
//
//  Created by fran on 30/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "AClass+tchAClassExt.h"

#import "Evaluation.h"

@implementation AClass (tchAClassExt)

//@dynamic daysSortedArray;

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
    
    // get the day ID
    
    // get the amount of existing days…
    NSInteger daysCount = [[self.classDays allObjects] count];
    
    // get the classID
    NSString *classID = self.classID;
    
    // …add one and create the DayID
    NSString *newDayID = [NSString stringWithFormat:@"%@%i", classID, daysCount];
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
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
    [newClassDay setValue:self forKey:@"forClass"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
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
                                  maxGrade:(int)maxGrade
                                      date:(NSDate*)date
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // create the evaluation object
    Evaluation *newEvaluation = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Evaluation"
                                 inManagedObjectContext:managedOC];
    
    
    // set the ID for the new evaluation
    [newEvaluation setValue:newID forKey:@"gradeID"];
    [newEvaluation setValue:newID forKey:@"nameShort"];
    
    // set the name for the new evaluation
    [newEvaluation setValue:name forKey:@"name"];
    
    // set the max grade for the new evaluation
    [newEvaluation setValue:[NSNumber numberWithInt:maxGrade] forKey:@"range"];
    
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
