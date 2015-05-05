//
//  tchAttendanceTableDel.m
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceTableDel.h"

@interface tchAttendanceTableDel ()

@property (strong,nonatomic) NSIndexPath *selectedCell;
@property (nonatomic) BOOL thereIsSelection;

@end

@implementation tchAttendanceTableDel

// Handling row selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // check the already selected cell
    if (self.thereIsSelection && self.selectedCell.row == indexPath.row) {
        
        self.thereIsSelection = FALSE;
        self.selectedCell = nil;
    
    } else {
        
        self.thereIsSelection = TRUE;
        self.selectedCell = indexPath;
        
    }
    
    
    // update table view
    [tableView beginUpdates];
    [tableView endUpdates];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


// Handling row size
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //check if the index actually exists
    if(self.thereIsSelection && self.selectedCell.row == indexPath.row) {
        
        return 240;
        
    }
    
    return 60;
    
}


@end
