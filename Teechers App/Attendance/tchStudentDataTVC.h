//
//  tchStudentDataTVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface tchStudentDataTVC : UITableViewCell

@property (strong,nonatomic) Student *studentForCell;
@property (strong, nonatomic) IBOutlet UICollectionView *dataCollection;

- (void)setupCellForStudent:(Student*)student atScrollIndex:(NSInteger)scrollIndex;
- (void)performDayScrollToIndex:(NSInteger)newIndex;

@end
