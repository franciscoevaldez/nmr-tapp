//
//  Evaluation+tchEvalExt.m
//  Teechers App
//
//  Created by fran on 31/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "Evaluation+tchEvalExt.h"
#import "AClass+tchAClassExt.h"

@implementation Evaluation (tchEvalExt)

// delete a class day
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

@end
