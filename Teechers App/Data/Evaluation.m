//
//  Evaluation.m
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "Evaluation.h"
#import "AClass+tchAClassExt.h"
#import "GradeRecord.h"

@implementation Evaluation

// Insert code here to add functionality to your managed object subclass

// method for updating an evaluation
- (Evaluation*)updateEvaluation:(NSString*)name withShortName:(NSString*)shortName date:(NSDate*)date range:(NSNumber*)range
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // set the name for the evaluation
    [self setValue:name forKey:@"name"];
    
    // set the short name
    [self setValue:shortName forKey:@"nameShort"];
    
    // set the date
    [self setValue:date forKey:@"date"];
    
    // set the range (max mark available)
    [self setValue:range forKey:@"range"];
    
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return self;
    
}

// delete this evaluation
- (void)deleteEval
{
    
    // get managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // deleted the object
    [managedOC deleteObject:self];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    
}


// get the sort array for this evaluation
- (NSInteger)getSortingIndex
{
    
    // get the sorted eval array for the related class
    NSArray *sortedArray = [self.forClass getEvaluationsSorted];
    
    // loop looking for this evaluation
    for (int i=0; i < [sortedArray count]; i++) {
        
        // get looped evaluation
        Evaluation *testEval = [sortedArray objectAtIndex:i];
        
        // check coincidence
        if (testEval == self) {
            
            // pass the index into a var
            return i;
            
        }
        
    }
    
    return 0;
}

@end
