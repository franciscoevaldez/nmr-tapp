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

-(void)setupForClassDay:(ClassDay*)editableDay
{
    
    // setup the property to the passed day
    self.activeDay = editableDay;
    
}

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
    
    
    
    // pass the current index path to the cell
    currentCell.indexPath = indexPath;
    
    // initialize the current data
    id currentData;
    
    // cast the editable object
    ClassDay *dayToEdit = tableView.editableObject;
    
    // check the data cases
    if (indexPath.row == 0) {
        // for the date case
        currentData = dayToEdit.date;
    }
    
    if (indexPath.row == 1) {
        // for the day name case
        currentData = dayToEdit.name;
    }
    
    currentCell.value = currentData;
    
    
    // setup from the data
    [newCell setupCell:currentCell];
    
    return newCell;
    
}

@end
