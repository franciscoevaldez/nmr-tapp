//
//  tchEvalColumnCell.h
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GradeRecord.h"
#import "Evaluation.h"

@interface tchEvalColumnCell : UICollectionViewCell

@property (strong,nonatomic) IBOutlet UILabel *dataLabel;
- (void) setupForRecord:(GradeRecord*)record orEvaluation:(Evaluation*)evaluation;

@end
