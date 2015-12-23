//
//  tchEvalHeaderCell.h
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Evaluation.h"

@interface tchEvalHeaderCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//- (void)setupCellForEvaluation:(Evaluation*)evaluation;
- (void)setupCellForEvaluation:(Evaluation*)evaluation withSeparator:(BOOL)showSeparator;

@end
