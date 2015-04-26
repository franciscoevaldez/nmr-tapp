//
//  tchAttDayCVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassDay.h"

@interface tchAttDayCVC : UICollectionViewCell

@property (strong,nonatomic) ClassDay *dayInCell;
- (void)setupCellForDay:(ClassDay*)classDay;

@end
