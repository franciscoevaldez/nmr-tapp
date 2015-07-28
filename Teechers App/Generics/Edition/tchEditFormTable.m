//
//  tchEditFormTable.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTable.h"

@implementation tchEditFormTable

-(void)setupCellArray{}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// give focus to a specific cell
-(void)focusIndexPath:(NSIndexPath*)indexPath{
    
    // get the count of sections
    NSInteger sectionCount = [self numberOfSections];
    
    // get the count of rows in the selected section
    NSInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    
    // in either section or row count are bigger than range, return
    if (indexPath.section > sectionCount || indexPath.row > rowCount) {
        return;
    }
    
    // get the cell for that index path
    tchEditFormTableCell *activeCell = (tchEditFormTableCell*)[self cellForRowAtIndexPath:indexPath];
    
    // become the first responder
    [activeCell getFocus];
    
    
}

// refresh the data array with an updated cell
-(void)refreshDataFromCell:(tchEditFormTableCell*)cell{
    
    // get the value from the cell
    id newValue = cell.value;
    
    // cast the editable object as a class day
    NSManagedObject *tempEditableObject = self.editableObject;
    
    // change the value for the property in that cell
    [tempEditableObject setValue:newValue forKey:cell.propertyName];
    
    // update the editable object of self from the transition
    self.editableObject = tempEditableObject;
    
    
}

// refresh the data from all cells
-(void)refreshData{
    
    for (tchEditFormTableCell* currentCell in self.visibleCells) {
        
        // tell the cell to refresh its value property
        [currentCell refreshCellValue:currentCell];
        
        // pass the new property from the cell to the editable onject
        [self refreshDataFromCell:currentCell];
        
        
    }
    
}

@end
