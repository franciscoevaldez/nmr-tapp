//
//  tchAStudentCell.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAStudentCell.h"

#import "Student+tchStudentsExt.h"
#import "tchColumnsCollection.h"

@interface tchAStudentCell ()

@property (strong,nonatomic) Student *studentForCell;

@property (strong,nonatomic) NSIndexPath *indexPath;

@property (strong,nonatomic) IBOutlet tchColumnsCollection *columnsCollection;
@property (strong,nonatomic) IBOutlet UILabel *studentNameLabel;

@end

@implementation tchAStudentCell

- (void)awakeFromNib {
    // Initialization code
}


// setup cell taking the student
- (void)setupCellForStudent:(Student*)student
              atScrollIndex:(NSInteger)scrollIndex
              withIndexPath:(NSIndexPath*)indexPath
                andDelegate:(id)tableView{
    
    // pass the student to the cell
    self.studentForCell = student;
    
    // set the label
    self.studentNameLabel.text = self.studentForCell.name;
    
    // tell the column controller to set itself up
    [self.columnsCollection setupForStudent:student];
    [self.columnsCollection reloadData];
    
    // set the student to the column collection
    //self.columnCollection.student = student;
    
    // set up the columns data source
    //[self.columnDataSource setupForStudent:student];
    
    // tell the column to reload
    //[self.columnCollection reloadData];
    
    // create a new index path
    //NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:scrollIndex inSection:0];
    
    // perform the scroll
    //[self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // store the new index to the property
    //self.activeColumn = scrollIndex;
    
    // pass the student to the input view
    //[self.inputView setupForStudent:student andColumn:scrollIndex];
    
    // set self as delegate for input view
    //self.inputView.delegate = self;
    
    // set column for the input
    //[self.inputView updateActiveColumn:scrollIndex];
    
    // set the indexPath for self
    self.indexPath = indexPath;
    
    // set the table as delegate of this cell
    self.delegate = tableView;
    
}

#pragma mark - Perform scroll
- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // if the cell has a collection…
    if (self.columnsCollection) {
        
        //…tell it to perform the scroll
        [self.columnsCollection performColumnScrollToIndex:newIndex];
    }
    
    // warn the input of the change
    //[self.inputView updateActiveColumn:newIndex];
    
}

#pragma mark - Input dismiss
- (void)cellShouldDismiss
{
    
    // tell the table a cell was selected
    [_delegate collapseCellAtIndexPath:self.indexPath];
    
    
}

#pragma mark - Selection handling
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
    
}

@end
