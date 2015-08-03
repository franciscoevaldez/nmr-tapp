//
//  tchEditFormTableDelegate.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTableDelegate.h"

#import "tchEditFormTableCell.h"

@implementation tchEditFormTableDelegate

// Handling row selection
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // hide the highlight
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

// Handling row size
- (CGFloat)tableView:(tchEditFormTable*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // check if the cell is of instruction type
    
    // get the current celltype
    NSString *cellType = [[tableView.formStruct objectAtIndex:indexPath.row] objectForKey:@"cellType"];
    
    // if it is instruction, return more
    if ([cellType isEqualToString:@"tchFormCellInstruction"]) {
        return 75;
    }
    
    return 60;
    
}



@end
