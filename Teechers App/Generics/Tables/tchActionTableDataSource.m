//
//  tchActionTableDataSource.m
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableDataSource.h"
#import "tchActionTableCell.h"

@implementation tchActionTableDataSource

-(NSInteger)tableView:(tchActionTableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    // tell the tableview to setup itself
    [tableView setupCellArray];
    
    // get the cell count for the table
    return [tableView.cellStruct count];
    
}


-(UITableViewCell*)tableView:(tchActionTableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    // get the current cell data array (to keep it at hand)
    NSDictionary *cellData = [tableView.cellStruct objectAtIndex:indexPath.row];
    
    // get the cell type from the form struct
    NSString *cellType = [cellData objectForKey:@"cellType"];
    
    // cast the new cell
    tchActionTableCell *newCell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    // call the cell to setup itself passing cell data
    [newCell setupCellWithStruct:cellData andIndexPath:indexPath];
    
    // return the new cell
    return newCell;
    
}

@end
