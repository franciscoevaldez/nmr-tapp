//
//  tchAttHeaderDaysCDS.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttHeaderDaysCDS.h"

#import "ClassDay.h"
#import "tchAttDayCVC.h"



@interface tchAttHeaderDaysCDS ()

@property (strong,nonatomic) NSArray *daysSortedArray;
@property (strong,nonatomic) AClass *selectedClass;

@end

@implementation tchAttHeaderDaysCDS

- (void)setupForClass:(AClass*)classForHeader{
    
    // pass the class to the object
    self.selectedClass = classForHeader;
    
    // get the days into an array
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[classForHeader.classDays allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *daysSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    // sort the array
    [tempArray sortUsingDescriptors:[NSArray arrayWithObject:daysSortDescr]];
    
    // pass the array to the data source class
    self.daysSortedArray = tempArray;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSInteger returnCount = [self.daysSortedArray count];
    
    return returnCount;
}

- (tchAttDayCVC*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    tchAttDayCVC *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayCell" forIndexPath:indexPath];
    
    // call the setup for the cell using the current day
    [newCell setupCellForDay:[self.daysSortedArray objectAtIndex:indexPath.row]];
    
    /*
    // get the number label
    UILabel *mainLabel = (UILabel *) [newCell viewWithTag:1];
    
    // write the new text in the label
    mainLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
     */
    
    return newCell;
    
}

@end
