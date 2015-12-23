//
//  tchGradesHeaderDataSource.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesHeaderDataSource.h"
#import "tchEvalHeaderCell.h"
#import "tchHeaderColumnCollection.h"

@interface tchGradesHeaderDataSource ()

@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) NSArray *evaluationsArray;

@end

@implementation tchGradesHeaderDataSource

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    self.activeClass = activeClass;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(tchHeaderColumnCollection *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // section 0 is the one of existing items
    if (section == 0) {
        
        // get the sorted array from the class
        NSArray *tempArray = [self.activeClass getEvaluationsSorted];
        
        // pass the array to the data source class
        self.evaluationsArray = tempArray;
        
        // Number of rows is the number of days in the array
        return [self.evaluationsArray count];
        
    }
    
    // section 1 is the one for the add buttons
    if (section == 1) {
        
        // check if there are classdays
        if ([self.activeClass.evaluations count] == 0) {
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
        if ([self.activeClass.evaluations count] == 0) {
            
            // create a new add cell
            UICollectionViewCell *addEvaluationCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addEvaluationCell" forIndexPath:indexPath];
            
            // return it
            return addEvaluationCell;
            
        }
        
    }
    
    // standard cell identifier
    NSString *cellType = @"columnCell";
    
    // check if this is the active column cell
    if (collectionView.activeColumn == indexPath.row) {
        cellType = @"columnCellActive";
    }
    
    // create the new cell
    tchEvalHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellType forIndexPath:indexPath];
    
    NSInteger dayCount = [self.evaluationsArray count];
    
    if (dayCount == 0) {
        return cell;
    }
    
    // get the day for this new cell
    Evaluation *currentEval = [self.evaluationsArray objectAtIndex:indexPath.row];
    
    // if this is the first cell or the first after the selected, remove the line
    bool useSeparator = YES;
    if (indexPath.row == 0 || (collectionView.activeColumn+1 == indexPath.row)) {
        useSeparator = NO;
    }
    
    // setup the cell
    [cell setupCellForEvaluation:currentEval withSeparator:useSeparator];
    
    // return the cell
    return cell;
    
}

@end
