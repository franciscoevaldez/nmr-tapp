//
//  tchEvalHeaderCell.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEvalHeaderCell.h"

@interface tchEvalHeaderCell ()

@property (strong,nonatomic) Evaluation *evaluationInCell;

@end

@implementation tchEvalHeaderCell

- (void)setupCellForEvaluation:(Evaluation*)evaluation{
    
    // set evaluation for class
    self.evaluationInCell = evaluation;
    
    // get short name
    NSString *shortName = evaluation.nameShort;
    
    // write month in label
    self.titleLabel.text = shortName;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected];
    
    // Configure the view for the selected state
    
    // Deselect in the end
    [super setSelected:NO];
    
}

@end
