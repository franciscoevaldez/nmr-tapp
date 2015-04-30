//
//  tchAttDayBandColDS.m
//  Day Band Collection Data Source
//  Teechers App
//
//  Created by fran on 27/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttDayBandColDS.h"

#import "ClassDay.h"
#import "tchAttDayCVC.h"

@interface tchAttDayBandColDS ()

@property (strong,nonatomic) NSArray *daysArray;
@property (weak, nonatomic) IBOutlet UICollectionView *dayCollection;

@end


@implementation tchAttDayBandColDS

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    self.activeClass = activeClass;
    
    [self.dayCollection reloadData];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // get the sorted array from the class
    NSArray *tempArray = [self.activeClass getDaysSorted];
    
    // pass the array to the data source class
    self.daysArray = tempArray;
    
    // Number of rows is the number of days in the array
    return [self.daysArray count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    tchAttDayCVC *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayPickCell"
                                                                      forIndexPath:indexPath];
    
    // get the day for this new cell
    ClassDay *currentDay = [self.daysArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForDay:currentDay];
    
    // return the cell
    return newCell;
    
}


@end
