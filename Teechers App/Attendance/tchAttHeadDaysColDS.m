//
//  tchAttHeadDaysColDS.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttHeadDaysColDS.h"

#import "ClassDay.h"
#import "tchAttDayCVC.h"

@interface tchAttHeadDaysColDS ()

@property (strong,nonatomic) NSArray *daysArray;
@property (weak, nonatomic) IBOutlet UICollectionView *dayCollection;

@end

@implementation tchAttHeadDaysColDS

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    // get the days into an array
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[activeClass.classDays allObjects]];
    
    // setup the sort descriptor
    NSSortDescriptor *studentsSortDescr = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    // sort the array
    [tempArray sortUsingDescriptors:[NSArray arrayWithObject:studentsSortDescr]];
    
    // pass the array to the data source class
    self.daysArray = tempArray;
    
    [self.dayCollection reloadData];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // Number of rows is the number of days in the array
    return [self.daysArray count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    tchAttDayCVC *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayCell"
                                                                      forIndexPath:indexPath];
    
    // get the day for this new cell
    ClassDay *currentDay = [self.daysArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForDay:currentDay];
    
    // return the cell
    return newCell;
    
}

@end
