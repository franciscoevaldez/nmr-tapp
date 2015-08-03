//
//  tchGradesHeaderDataSource.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesHeaderDataSource.h"
#import "tchEvalHeaderCell.h"

@interface tchGradesHeaderDataSource ()

@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) NSArray *evaluationsArray;

@end

@implementation tchGradesHeaderDataSource

// setup and sort the students for usage
- (void)setupForClass:(AClass*)activeClass{
    
    self.activeClass = activeClass;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // pass the array to the data source class
    self.evaluationsArray = [self.activeClass getEvaluationsSorted];
    
    // Number of rows is the number of days in the array
    if ([self.evaluationsArray count]==0) {
        return 1;
    }
    
    // Number of rows is the number of days in the array
    return [self.evaluationsArray count];
    
}


- (tchEvalHeaderCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // create the new cell
    //tchEvalHeaderCell *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"columnCell" forIndexPath:indexPath];
    
    tchEvalHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"columnCell"
                                                                        forIndexPath:indexPath];
    
    NSInteger dayCount = [self.evaluationsArray count];
    
    if (dayCount == 0) {
        return cell;
    }
    
    // get the day for this new cell
    Evaluation *currentEval = [self.evaluationsArray objectAtIndex:indexPath.row];
    
    // setup the cell
    //[newCell setupCellForEvaluation:currentEval];
    
    [cell setupCellForEvaluation:currentEval];
    
    // return the cell
    return cell;
    
}

@end
