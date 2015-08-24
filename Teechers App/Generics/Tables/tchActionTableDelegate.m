//
//  tchActionTableDelegate.m
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableDelegate.h"
#import "tchActionTableView.h"

#import "AClass.h"

@implementation tchActionTableDelegate

- (void)tableView:(tchActionTableView*)tableView runAction:(NSString*)action{}

// Handling row selection
- (void)tableView:(tchActionTableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // hide the highlight
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // check if the selected type is action
    NSString *cellType = [[tableView.cellStruct objectAtIndex:indexPath.row] objectForKey:@"cellType"];
    
    if ([cellType isEqualToString:@"tchCellTypeAction"]) {
        
        [self tableView:tableView runAction:[[tableView.cellStruct objectAtIndex:indexPath.row] objectForKey:@"action"]];
        
    }
    
}

// Handling row size
- (CGFloat)tableView:(tchActionTableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // check if the cell is of instruction type
    
    // get the current celltype
    NSString *cellType = [[tableView.cellStruct objectAtIndex:indexPath.row] objectForKey:@"cellType"];
    
    // alter cell height
    if ([cellType isEqualToString:@"tchCellTypeSection"]) {return 40;}
    if ([cellType isEqualToString:@"tchCellTypeShare"]) {return 180;}
    
    return 60;
    
}

@end
