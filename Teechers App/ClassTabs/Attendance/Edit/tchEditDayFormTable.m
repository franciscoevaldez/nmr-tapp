//
//  tchEditDayFormTable.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditDayFormTable.h"
#import "tchEditFormTableCell.h"
#import "tchEditDayFormTableDS.h"

@implementation tchEditDayFormTable

// cell for getting the cell array
-(void)setupCellArray
{
    // each cell is a cell element
    tchEditFormTableCell *firstCell = [[tchEditFormTableCell alloc] init];
    firstCell.cellType = tchFormCellLabelAndDateInput;
    firstCell.labelText = @"Date";
    firstCell.inputPlaceholder = @"Class Date";
    
    tchEditFormTableCell *secondCell = [[tchEditFormTableCell alloc] init];
    secondCell.cellType = tchFormCellLabelAndTextInput;
    secondCell.labelText = @"Name";
    secondCell.inputPlaceholder = @"(Optional)";
    
    NSArray *cellsArray = [NSArray arrayWithObjects:firstCell, secondCell, nil];
    
    self.cellsArray = cellsArray;

}

-(void)setupForClassDay:(ClassDay*)editableClassDay andClass:(AClass*)activeClass
{
    
    // get the class day to the data source
    
    // if the class day is nil, create one
    if (!editableClassDay) {
        
        // init the class day object
        ClassDay *newClassDay = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"ClassDay"
                                 inManagedObjectContext:activeClass.managedObjectContext];

        // set the class it relates to
        [newClassDay setValue:activeClass forKey:@"forClass"];
        
        // set the editable to the new day
        editableClassDay = newClassDay;
        
    }
    
    // get the editable day to the table property
    self.editableObject = editableClassDay;
    
}

// refresh the data array with an updated cell
-(void)refreshDataFromCell:(tchEditFormTableCell*)cell{
    
    // get the value from the cell
    id newValue = cell.value;
    
    // get the row of the cell
    NSInteger cellRow = [cell.indexPath row];
    
    // cast the editable object as a class day
    ClassDay *transitionDay = (ClassDay*)self.editableObject;
    
    
    // check which row was updated and change accordingly
    if (cellRow==0) {
        transitionDay.date = newValue;
    }
    if (cellRow==1) {
        transitionDay.name = newValue;
    }
    
    // update the editable object of self from the transition
    self.editableObject = transitionDay;
    
    
}

-(void)refreshData{
    
    for (tchEditFormTableCell* currentCell in self.visibleCells) {
        
        // tell the cell to refresh its value
        [currentCell refreshCellValue:currentCell];
        
        // get the row of the cell
        NSInteger cellRow = [currentCell.indexPath row];
        
        // get the value from the cell
        id newValue = currentCell.value;
        
        // cast the editable object as a class day
        ClassDay *transitionDay = (ClassDay*)self.editableObject;
        
        
        // check which row was updated and change accordingly
        if (cellRow==0) {
            transitionDay.date = newValue;
        }
        if (cellRow==1) {
            transitionDay.name = newValue;
        }
        
        // update the editable object of self from the transition
        self.editableObject = transitionDay;
        
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
