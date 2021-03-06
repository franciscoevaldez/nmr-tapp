//
//  tchGradesColumnsDS.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradesColumnsDS.h"
#import "tchColumnsCollection.h"
#import "tchEvalColumnCell.h"

@interface tchGradesColumnsDS ()

@property (strong,nonatomic) NSArray *evaluationsArray;

@end

@implementation tchGradesColumnsDS

- (void)setupForStudent:(Student*)activeStudent{
    
    // pasar el estudiante a la celda
    self.activeStudent = activeStudent;
    
}

- (NSInteger)collectionView:(tchColumnsCollection *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    // get the sorted days array into the cell
    self.evaluationsArray = [self.activeStudent.inClass getEvaluationsSorted];
    
    // get amount of days
    NSInteger evalCount = [self.evaluationsArray count];
    
    // Number of rows is the number of days in the array
    if (evalCount==0) {
        return 1;
    }
    
    // Number of rows is the number of days in the array
    return evalCount;
    
    
    
}


- (UICollectionViewCell *)collectionView:(tchColumnsCollection *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // the cell for when there are no cells
    if ([self.activeStudent.inClass.evaluations count] == 0) {
        
        UICollectionViewCell *emptyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"emptyCell" forIndexPath:indexPath];
        
        return emptyCell;
        
    }
    
    // create the new cell
    tchEvalColumnCell *newCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"studentDataCell" forIndexPath:indexPath];
    
    NSInteger evalCount = [[self.activeStudent.inClass.evaluations allObjects] count];
    
    if (evalCount == 0) {
        return newCell;
    }
    
    // get the current day
    Evaluation *currentEvaluation = [self.evaluationsArray objectAtIndex:indexPath.row];
    
    // look for the record belonging to that day
    GradeRecord* currentRecord = [collectionView.activeStudent getGradeForEvaluation:currentEvaluation];
    
    // tell the cell to configure itself for that record
    [newCell setupForRecord:currentRecord orEvaluation:currentEvaluation];
    
    // return the cell
    return newCell;
    
}


@end
