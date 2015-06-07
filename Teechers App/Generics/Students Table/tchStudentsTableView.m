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

@property (nonatomic) BOOL isEnabled;

@end


@implementation tchStudentsTableView

- (void)setupForClass:(AClass*)activeClass{
    
    self.tchDataSource = self.dataSource;
    [self.tchDataSource setupForClass:activeClass];
    
}

#pragma mark - Full Reloading
- (void)reloadAllData{
    
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
    [self selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:UITableViewScrollPositionNone];
    
    [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    
}

@end
