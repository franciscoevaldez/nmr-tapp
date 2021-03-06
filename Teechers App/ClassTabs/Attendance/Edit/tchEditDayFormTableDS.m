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


-(NSInteger)tableView:(nonnull tchEditDayFormTable *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.formStruct count];
}


-(tchEditFormTableCell*)tableView:(nonnull tchEditDayFormTable *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    // get the current cell data array (to keep it at hand)
    NSDictionary *cellData = [tableView.formStruct objectAtIndex:indexPath.row];
    
    // get the cell type from the form struct
    NSString *cellType = [cellData objectForKey:@"cellType"];
    
    // cast the new cell
    tchEditFormTableCell *newCell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    // get the value to display
    id currentData = [tableView.editableObject valueForKey:[cellData objectForKey:@"propertyName"]];
    
    // call the cell to setup itself passing: struct data + data to display
    [newCell setupCellWithStruct:cellData data:currentData andIndexPath:indexPath];
    
    // return the new cell
    return newCell;
    
}

@end
