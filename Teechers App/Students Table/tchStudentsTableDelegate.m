//
//  tchStudentsTableDelegate.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableDelegate.h"
#import "tchStudentsTableView.h"

@implementation tchStudentsTableDelegate

// Handling row selection
- (void)tableView:(tchStudentsTableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
