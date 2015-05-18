//
//  tchAttendanceTableV.m
//  Teechers App
//
//  Created by fran on 2/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceTableV.h"
#import "tchAttendanceColumnVC.h"
#import "tchAttendanceTableDS.h"
#import "tchAttendanceTableDel.h"
#import "tchStudentDataTVC.h"

@interface tchAttendanceTableV ()

@property (assign,nonatomic) NSInteger currentColumnIndex;
@property (strong,nonatomic) IBOutlet tchAttendanceTableDS *attendanceTableDS;
@property (strong,nonatomic) IBOutlet tchAttendanceTableDel *attendanceTableDel;

@end

@implementation tchAttendanceTableV

- (void)setupForClass:(AClass*)activeClass{
        
    [self.attendanceTableDS setupForClass:activeClass];
    
}

#pragma mark - Full Reloading
- (void) fullReload
{
    
    // reload the cells
    [self reloadData];
    
    // tell the visible cells to reload columns
    NSArray *visibleCells = [self visibleCells];
    
    // loop through every cell
    for (tchStudentDataTVC *currentCell in visibleCells) {
        
        // tell each one to scroll
        [currentCell reloadColumns];
        
    }
    
    
}

#pragma mark - handling cell scroll
- (void) performDayScrollToIndex:(NSInteger)newIndex{
    
    // tell every cell to skip to the new index
    NSArray *visibleCells = [self visibleCells];
    
    // loop through every cell
    for (tchStudentDataTVC *currentColumn in visibleCells) {
        
        // tell each one to scroll
        [currentColumn performDayScrollToIndex:newIndex];
        
    }
    
    // store the new index to the property
    self.currentColumnIndex = newIndex;
    
    // tell the attendance data source the new index
    self.attendanceTableDS.currentScrollIndex = self.currentColumnIndex;
    
}

#pragma mark - Input should dismiss
- (void)dismissInputAtIndexPath:(NSIndexPath *)indexPath
{
    
    // tell the table that a cell was selected
    [self selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:UITableViewScrollPositionNone];
    
    [self.attendanceTableDel tableView:self didSelectRowAtIndexPath:indexPath];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
