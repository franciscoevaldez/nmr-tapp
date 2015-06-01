//
//  tchGradeInputDataSource.m
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradeInputDataSource.h"

#import "tchSimpleCollectionViewCell.h"

@implementation tchGradeInputDataSource

- (void)setupForStudent:(Student*)student columnIndex:(NSInteger)index{
    
    // pass the recieved evaluation to the property
    self.activeStudent = student;
    self.activeClass = student.inClass;
    self.activeEvaluation = [self.activeClass getEvaluationForIndex:index];

};


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.activeEvaluation.range integerValue];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // setup the input cell
    tchSimpleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleInputCell" forIndexPath:indexPath];
    
    // setup the main object: an ns number
    NSNumber *inputObject = [NSNumber numberWithInt:indexPath.row+1];
    
    // write the label: the nsnumber
    cell.mainLabel.text = [NSString stringWithFormat:@"%@", inputObject];
    
    // the input return item is an ns number with the grade
    cell.returnItem = inputObject;
    
    return cell;
    
}

@end
