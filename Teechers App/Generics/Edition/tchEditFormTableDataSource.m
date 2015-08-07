//
//  tchEditFormTableDataSource.m
//  Teechers App
//
//  Created by fran on 8/3/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTableDataSource.h"

@implementation tchEditFormTableDataSource 

-(NSInteger)tableView:(tchEditFormTable*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableView.formStruct count];
}


-(tchEditFormTableCell*)tableView:(tchEditFormTable*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    // get the current cell data array (to keep it at hand)
    NSDictionary *cellData = [tableView.formStruct objectAtIndex:indexPath.row];
    
    // get the cell type from the form struct
    NSString *cellType = [cellData objectForKey:@"cellType"];
    
    // cast the new cell
    tchEditFormTableCell *newCell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    // get the property name for the managed object
    NSString *propertyName = [cellData objectForKey:@"propertyName"];
    
    // initialize current data object
    id currentData = [tableView.formDataDict valueForKey:propertyName];
    
    // get the value to display
    /*
    if (tableView.editableObject && ![propertyName isEqualToString:@""]) {
        currentData = [tableView.editableObject valueForKey:propertyName];
    }
     */
    
    // temp current data
    
    if (![currentData isEqual:@"void"] && ![propertyName isEqualToString:@""]) {
        currentData = [tableView.formDataDict valueForKey:propertyName];
    } else {
        currentData = nil;
    }
    
    // call the cell to setup itself passing: struct data + data to display
    [newCell setupCellWithStruct:cellData data:currentData andIndexPath:indexPath];
    
    // return the new cell
    return newCell;
    
}

@end
