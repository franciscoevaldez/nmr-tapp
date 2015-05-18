//
//  tchStudentDataTVC.h
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "tchAttInputV.h"

@protocol tchStudentCellProtocol <NSObject>

-(void)dismissInputAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface tchStudentDataTVC : UITableViewCell <tchInputProtocol>

@property (nonatomic, weak) id <tchStudentCellProtocol> delegate;

@property (strong,nonatomic) Student *studentForCell;
@property (strong, nonatomic) IBOutlet UICollectionView *dataCollection;

- (void)setupCellForStudent:(Student*)student
              atScrollIndex:(NSInteger)scrollIndex
              withIndexPath:(NSIndexPath*)indexPath
                andDelegate:(id)tableView;

- (void)reloadColumns;
- (void)performDayScrollToIndex:(NSInteger)newIndex;

@end
