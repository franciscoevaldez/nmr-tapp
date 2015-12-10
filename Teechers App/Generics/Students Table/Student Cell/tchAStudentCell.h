//
//  tchAStudentCell.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchInputView.h"

#import "Student.h"
#import "tchColumnsCollection.h"
#import "tchInputView.h"

@protocol tchStudentCellProtocol <NSObject>

-(void)collapseCellAtIndexPath:(NSIndexPath*)indexPath;

@end



@interface tchAStudentCell : UITableViewCell <tchInputDelegateProtocol, UICollectionViewDelegate>

@property (nonatomic, weak) id <tchStudentCellProtocol> delegate;

- (void)setupCellForStudent:(Student*)student
              atScrollIndex:(NSInteger)scrollIndex
              withIndexPath:(NSIndexPath*)indexPath
                andDelegate:(id)tableView;
- (void)reloadAllData;
- (void)performDayScrollToIndex:(NSInteger)newIndex;

@property (strong,nonatomic) Student *studentForCell;
@property (strong,nonatomic) IBOutlet tchColumnsCollection *columnsCollection;
@property (strong,nonatomic) IBOutlet tchInputView *inputView;
@property (strong,nonatomic) IBOutlet UILabel *studentNameLabel;

@end
