//
//  tchStudentsTableDel.m
//  Teechers App
//
//  Created by fran on 4/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsTableDel.h"

@interface tchStudentsTableDel ()

@property (strong,nonatomic) NSIndexPath * selectedCell;
@property (nonatomic) NSInteger selectedIndex;

@end

@implementation tchStudentsTableDel

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // check if the clicked is already selected
    if (self.selectedIndex == indexPath.row) {
        
        // if it is, clear it
        self.selectedIndex = -1;
        self.selectedCell = nil;

        
    } else {
        
        // if it isn't, store the current index path
        self.selectedIndex = indexPath.row;
        self.selectedCell = indexPath;
        
    }
    
    
    // reload the selected cell
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    if(indexPath.row == self.selectedCell.row) {
        
        return 160;
        NSLog(@"selected");
        
    }
    
    return 60;
    
}

@end
