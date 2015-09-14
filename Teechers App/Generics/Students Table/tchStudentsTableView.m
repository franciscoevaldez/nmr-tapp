//
//  tchStudentsTableView.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableView.h"

// importar el Data Source de esta tabla
#import "tchStudentsTableDataSource.h"

// importar el Delegate de esta tabla
#import "tchStudentsTableDelegate.h"

#import "tchAStudentCell.h"

@interface tchStudentsTableView()

@property (assign,nonatomic) NSInteger currentColumnIndex;
@property (strong,nonatomic) tchStudentsTableDataSource *tchDataSource;

@end


@implementation tchStudentsTableView

- (void)setupForClass:(AClass*)activeClass{
    
    self.tchDataSource = self.dataSource;
    [self.tchDataSource setupForClass:activeClass];
    
}

#pragma mark - Full Reloading
- (void)reloadAllData{
    
    // reload the students array
    [(tchStudentsTableDataSource*)self.dataSource reloadStudentsArray];
    
    // reload the cells
    [self reloadData];
    
    // tell the visible cells to reload columns
    NSArray *visibleCells = [self visibleCells];
    
    // loop through every cell
    for (tchAStudentCell *currentCell in visibleCells) {
        
        // tell each one to scroll
        [currentCell reloadAllData];
        
    }
    
    
}

#pragma mark - Disable table
- (void)enableTableNewStatus:(BOOL)newStatus{
    
    if (!newStatus) {
        
        self.scrollEnabled = false;
        
        self.isEnabled = false;
        
    } else {
    
        self.scrollEnabled = true;
        
        self.isEnabled = true;
        
    }
    
}

#pragma mark - handling cell scroll
- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // tell every cell to skip to the new index
    NSArray *visibleCells = [self visibleCells];
    
    // loop through every cell
    for (tchAStudentCell *currentColumn in visibleCells) {
        
        // tell each one to scroll
        [currentColumn performDayScrollToIndex:newIndex];
        
    }
    
    // store the new index to the property
    self.currentColumnIndex = newIndex;
    
    // tell the attendance data source the new index
    self.tchDataSource.currentScrollIndex = self.currentColumnIndex;
    
}

#pragma mark - Input should dismiss
- (void)collapseCellAtIndexPath:(NSIndexPath *)indexPath
{
    
    // tell the table that a cell was selected
    [self triggerSelectAtIndexPath:indexPath];
    /*
    [self selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:UITableViewScrollPositionNone];
    [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];*/
    
    NSIndexPath *newIP = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    
    // if we have continuous mode on, select the following
    if (self.continuousMode && newIP.row < self.totalCells) {
        
        [self triggerSelectAtIndexPath:newIP];
        
    } else {
        
        self.continuousMode = false;
        
    }
    
}

- (void)triggerSelectAtIndexPath:(NSIndexPath*)indexPath
{
    
    // select it
    [self selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    // trigger the events
    [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    
}

@end
