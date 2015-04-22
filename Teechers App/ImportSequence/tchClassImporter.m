//
//  tchClassImporter.m
//  Class that takes arrays and metadata, parses it and stores it in core data database
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchClassImporter.h"

#import "AClass.h"
#import "Student.h"

@implementation tchClassImporter

-(void)parseAndSaveANewClass
{
    // create a new class object
    AClass *aNewClass = [NSEntityDescription
                         insertNewObjectForEntityForName:@"AClass"
                         inManagedObjectContext:self.managedObjectContext];
    
    // assign class ID
    NSString *timestampID = [NSString stringWithFormat:@"TEECHAPP%f",[[NSDate date] timeIntervalSince1970] * 1000];
    [aNewClass setValue:timestampID forKey:@"classID"];
    
    // add the name attribute
    [aNewClass setValue:self.theNewClassName forKey:@"name"];
    
    // add the institution attribute
    [aNewClass setValue:self.institutionName forKey:@"institution"];
    
    // save in store
    NSError *NuError;
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
    
    // get the stored class for linking the students
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AClass" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    NSPredicate *searchFilter = [NSPredicate predicateWithFormat:@"classID = %@", timestampID];
    [request setPredicate:searchFilter];
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    AClass *createdClass = [results objectAtIndex:0];
    
    // loop for every student
    for (int stInd=0; stInd<[self.studentsArray count]; stInd++) {
        
        // create a new student object
        Student *aNewStudent = [NSEntityDescription
                                insertNewObjectForEntityForName:@"Student"
                                inManagedObjectContext:self.managedObjectContext];
        
        // add the student id
        NSString *studentID = [NSString stringWithFormat:@"STD%i", stInd];
        [aNewStudent setValue:studentID forKey:@"studentID"];
        
        // add the name attribute
        [aNewStudent setValue:[self.studentsArray objectAtIndex:stInd] forKey:@"name"];
        
        // associate it to the class being created
        [aNewStudent setValue:createdClass forKey:@"inClass"];
        
        
    }
    
    // save all the students in store
    if (![self.managedObjectContext save:&NuError]) {
        NSLog(@"error en: %@", [NuError localizedDescription]);
    }
    
    
}

@end
