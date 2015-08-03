//
//  tchSimpleCollectionViewCell.h
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchSimpleCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) IBOutlet UILabel *mainLabel;
@property (strong,nonatomic) IBOutlet UILabel *secondaryLabel;
@property (strong,nonatomic) IBOutlet UILabel *thirdLabel;

@property (strong,nonatomic) id returnItem;
@property (strong,nonatomic) id returnItemSecond;

@end
