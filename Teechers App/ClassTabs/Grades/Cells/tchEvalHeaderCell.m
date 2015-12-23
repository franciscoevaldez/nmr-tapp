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
@property (strong, nonatomic) IBOutlet UIView *separatorView;

@end

@implementation tchEvalHeaderCell

- (void)setupCellForEvaluation:(Evaluation*)evaluation withSeparator:(BOOL)showSeparator{
    
    // set evaluation for class
    self.evaluationInCell = evaluation;
    
    // get short name
    NSString *shortName = evaluation.nameShort;
    
    // remove the separator
    if (self.separatorView && !(showSeparator)) {
        self.separatorView.hidden = YES;
    } else {
        self.separatorView.hidden = NO;
    }
    
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
