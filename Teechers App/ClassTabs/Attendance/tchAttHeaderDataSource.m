//
//  tchAttHeaderDataSource.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttHeaderDataSource.h"
#import "tchHeaderColumnCollection.h"
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

- (NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // section 0 is the one of existing items
    if (section == 0) {
        
        // get the sorted array from the class
        NSArray *tempArray = [self.activeClass getDaysSorted];
        
        // pass the array to the data source class
        self.daysArray = tempArray;
        
        // Number of rows is the number of days in the array
        return [self.daysArray count];
        
    }
    
    // section 1 is the one for the add buttons
    if (section == 1) {
        
        // check if there are classdays
        if ([self.activeClass.classDays count] == 0) {
            return 1;
        }
        
    }
    
    return 0;
}


- (UICollectionViewCell *)collectionView:(tchHeaderColumnCollection *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // section 1 is the one for the add buttons
    if (indexPath.section == 1) {
        
        // if there are no class days
        // check if there are classdays
        if ([self.activeClass.classDays count] == 0) {
            
            // create a new add cell
            UICollectionViewCell *addClassCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addDayCell" forIndexPath:indexPath];
            
            // return it
            return addClassCell;
            
        }
        
    }
    
    // standard cell identifier
    NSString *cellType = @"dayCell";
    
    // check if this is the active column cell
    if (collectionView.activeColumn == indexPath.row) {
        cellType = @"dayCellActive";
    }
    
    
    // create the new cell
    tchAttDayCVC *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellType forIndexPath:indexPath];
    
    // get the day for this new cell
    ClassDay *currentDay = [self.daysArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForDay:currentDay];
    
    // return the cell
    return newCell;
    
}

@end
