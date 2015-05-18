//
//  tchStudentDataTVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentDataTVC.h"

#import "tchStudentAttendanceDS.h"
#import "tchAttInputV.h"

#import "tchCollectionIndexed.h"

@interface tchStudentDataTVC ()

@property (strong,nonatomic) IBOutlet UILabel *studentNameLabel;
@property (strong,nonatomic) IBOutlet tchStudentAttendanceDS *columnDataSource;
@property (strong,nonatomic) IBOutlet tchCollectionIndexed *columnCollection;
@property (strong,nonatomic) IBOutlet tchAttInputV *inputView;

@property (strong,nonatomic) NSIndexPath *indexPath;
@property (assign,nonatomic) NSInteger activeColumn;

@end

@implementation tchStudentDataTVC

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
    
    // set the student to the column collection
    self.columnCollection.student = student;
    
    // set up the columns data source
    [self.columnDataSource setupForStudent:student];
    
    // tell the column to reload
    [self.columnCollection reloadData];
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:scrollIndex inSection:0];
    
    // perform the scroll
    [self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // store the new index to the property
    self.activeColumn = scrollIndex;
    
    // pass the student to the input view
    [self.inputView setupForStudent:student andColumn:scrollIndex];
    
    // set self as delegate for input view
    self.inputView.delegate = self;
    
    // set column for the input
    //[self.inputView updateActiveColumn:scrollIndex];
    
    // set the indexPath for self
    self.indexPath = indexPath;
    
    // set the table as delegate of this cell
    self.delegate = tableView;
    
}

#pragma mark - Reload Columns
- (void)reloadColumns
{
    
    [self.columnCollection reloadData];
    
}

#pragma mark - Handling column scroll
- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeColumn = newIndex;
    
    // warn the input of the change
    [self.inputView updateActiveColumn:newIndex];
    
}

#pragma mark - Input dismiss
- (void)inputShouldDismiss
{
        
    // tell the table a cell was selected
    [_delegate dismissInputAtIndexPath:self.indexPath];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}


-(void)setupForStudent:(Student *)student andColumn:(NSInteger)columnIndex{}
-(void)updateActiveColumn:(NSInteger)columnIndex{};

@end
