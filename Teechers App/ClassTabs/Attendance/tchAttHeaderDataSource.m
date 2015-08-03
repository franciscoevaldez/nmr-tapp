//
//  tchAttHeaderDataSource.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttHeaderDataSource.h"
#import "tchAttDayCVC.h"

@interface tchAttHeaderDataSource ()

@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) NSArray *daysArray;

@end

@implementation tchAttHeaderDataSource

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    self.activeClass = activeClass;
    
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
