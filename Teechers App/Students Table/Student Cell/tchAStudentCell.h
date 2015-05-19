//
//  tchAStudentCell.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tchInputView.h"

@protocol tchStudentCellProtocol <NSObject>

-(void)collapseCellAtIndexPath:(NSIndexPath*)indexPath;

@end



@interface tchAStudentCell : UITableViewCell <tchInputDelegateProtocol>

@property (nonatomic, weak) id <tchStudentCellProtocol> delegate;

- (void)performDayScrollToIndex:(NSInteger)newIndex;

@end
