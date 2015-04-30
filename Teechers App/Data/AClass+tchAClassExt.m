//
//  AClass+tchAClassExt.m
//  Teechers App
//
//  Created by fran on 30/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "AClass+tchAClassExt.h"

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




@end
