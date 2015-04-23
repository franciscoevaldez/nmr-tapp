//
//  tchOneClassTVC.h
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"

@interface tchOneClassTVC : UITableViewCell

@property(strong,nonatomic) AClass *classInCell;
- (void)setupCellForClass:(AClass*)classForThisCell;

@end
