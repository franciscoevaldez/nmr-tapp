//
//  tchEditDayFormTableDS.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditDayFormTableDS.h"
#import "tchEditFormTableCell.h"

@implementation tchEditDayFormTableDS

-(NSInteger)tableView:(nonnull tchEditFormTable *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.cellsArray count];
}

-(tchEditFormTableCell*)tableView:(nonnull tchEditFormTable *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    tchEditFormTableCell *newCell;
    
    // get the current cell from the array
    tchEditFormTableCell *currentCell = [tableView.cellsArray objectAtIndex:indexPath.row];
    
    // get the cell type
    NSString *cellType = [currentCell getCellTypeString];
    
    // dequeue the cell for the cell type
    newCell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    // setup from the data
    [newCell setupCell:currentCell];
    
    return newCell;
    
}

@end
