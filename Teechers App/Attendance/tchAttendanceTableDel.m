//
//  tchAttendanceTableDel.m
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceTableDel.h"
#import "tchAttendanceTableV.h"

@implementation tchAttendanceTableDel

// Handling row selection
- (void)tableView:(tchAttendanceTableV *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // check the already selected cell
    if (tableView.thereIsSelection && tableView.selectedPath.row == indexPath.row) {
        
        tableView.thereIsSelection = FALSE;
        tableView.selectedPath = nil;
        
        tableView.scrollEnabled = TRUE;
    
    } else {
        
        tableView.thereIsSelection = TRUE;
        tableView.selectedPath = indexPath;
        
        tableView.scrollEnabled = FALSE;
        
    }
    
    // update table view
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // scroll the selected cell to top
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}


// Handling row size
- (CGFloat)tableView:(tchAttendanceTableV *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //check if the index actually exists
    if(tableView.thereIsSelection && tableView.selectedPath.row == indexPath.row) {
        
        return 241;
        
    }
    
    return 60;
    
}


@end
