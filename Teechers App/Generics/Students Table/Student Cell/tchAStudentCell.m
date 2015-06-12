//
//  tchAStudentCell.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAStudentCell.h"

@interface tchAStudentCell ()

@property (strong,nonatomic) NSIndexPath *indexPath;

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
    
    // if the cell has a column collection…
    if (self.columnsCollection) {
        
        // …tell the column controller to set itself up
        [self.columnsCollection setupForStudent:student andColumn:scrollIndex];
        [self.columnsCollection reloadData];
        
    }
    
    // if the cell has an input…
    if (self.inputView) {
        
        // …tell the input to set itself up
        [self.inputView setupForStudent:student andColumn:scrollIndex];
        [self.inputView setupDelegate:self];
        
    }

    
    
    // create a new index path
    
    // store the new index to the property
    //self.activeColumn = scrollIndex;
    
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
    
}

#pragma mark - Reload Columns
- (void)reloadAllData
{
    
    [self.columnsCollection reloadData];
    
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
