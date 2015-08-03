//
//  ClassDay+tchClassDayExt.m
//  Teechers App
//
//  Created by fran on 31/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "ClassDay+tchClassDayExt.h"

@implementation ClassDay (tchClassDayExt)

// method for updating a class day
- (ClassDay*)updateDayWithDate:(NSDate*)date name:(NSString*)name
{
    
    // get the managed object context
    NSManagedObjectContext *managedOC = self.managedObjectContext;
    
    // set the name for the new day
    [self setValue:date forKey:@"date"];
    
    // set the name for the new day
    [self setValue:name forKey:@"name"];
    
    // write in permanent store
    NSError *dayError;
    if (![managedOC save:&dayError]) {
        NSLog(@"error en: %@", [dayError localizedDescription]);
    }
    
    // return the created day
    return self;
    
}


// delete a class day
- (void)deleteClassDay
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
