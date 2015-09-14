//
//  tchStudentsTableDelegate.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableDelegate.h"

@implementation tchStudentsTableDelegate

- (void)clearSelectionForTableView:(tchStudentsTableView*)tableView
{
    
    // delete the selected cell
    //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:tableView.deployedPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    NSIndexPath *oldIndexPath = tableView.deployedPath;
    
    [self tableView:tableView didSelectRowAtIndexPath:oldIndexPath];
    
    // reload the table view
    [tableView reloadData];
    
    
}

- (void)reloadSelectedCellInTableView:(tchStudentsTableView*)tableView
{
    if (tableView.thereIsACellDeployed) {
        
        // tap the active cell
        [self tableView:tableView didSelectRowAtIndexPath:tableView.deployedPath];
        
    }
}

// Handling row selection
- (void)tableView:(tchStudentsTableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // if edition is disabled, disregard the touch
    if (!tableView.isEnabled) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
        
    }
    
    // check the already selected cell
    if (tableView.thereIsACellDeployed && tableView.deployedPath.row == indexPath.row) {
        
        tableView.thereIsACellDeployed = FALSE;
        tableView.deployedPath = nil;
        
        tableView.scrollEnabled = TRUE;
        
    } else {
        
        tableView.thereIsACellDeployed = TRUE;
        tableView.deployedPath = indexPath;
        
        tableView.scrollEnabled = FALSE;
        
    }
    
    // update table view
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // scroll the selected cell to top
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

// Handling row size
- (CGFloat)tableView:(tchStudentsTableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //check if the index actually exists
    if(tableView.thereIsACellDeployed &&
       tableView.deployedPath.row == indexPath.row) {
        
        if (tableView.deployedCellHeight) {
            return tableView.deployedCellHeight;
        }
        
        return 200;
        
    }
    
    return 60;
    
}


@end
