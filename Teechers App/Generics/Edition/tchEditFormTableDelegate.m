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
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}



@end
