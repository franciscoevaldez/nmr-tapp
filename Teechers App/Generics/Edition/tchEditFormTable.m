//
//  tchEditFormTable.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTable.h"

@implementation tchEditFormTable

// cell for getting the cell array
-(void)setupCellArray{}
-(void)setupCellArrayFromPlist:(NSString*)urlString
{
    
    // setup the url
    NSURL *file = [[NSBundle mainBundle] URLForResource:urlString withExtension:@"plist"];
    
    // create a dictionary with the contents
    NSArray *plistDict = [NSArray arrayWithContentsOfURL:file];
    
    // pass it to the self
    self.formStruct = plistDict;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Cell focus handling
// give focus to a specific cell
-(void)focusIndexPath:(NSIndexPath*)indexPath{
    
    // get the count of sections
    NSInteger sectionCount = [self numberOfSections];
    
    // get the count of rows in the selected section
    NSInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    
    // in either section or row count are bigger than range, exit
    if (indexPath.section > sectionCount || indexPath.row > rowCount) {return;}
    
    // get the cell for that index path
    tchEditFormTableCell *activeCell = (tchEditFormTableCell*)[self cellForRowAtIndexPath:indexPath];
    
    // become the first responder
    [activeCell getFocus];
    
    
    // if the cell to select is of instruction type, skip to the next
    if (activeCell.cellType == tchFormCellInstruction) {
        [self focusFollowingCell:activeCell];
    }
    
    
}

-(void)focusFollowingCell:(tchEditFormTableCell*)cell{
    
    // get the index path for the passed cell
    NSIndexPath *indexPath = cell.indexPath;
    
    // get row count for this section
    NSInteger rowCount = [self numberOfRowsInSection:indexPath.section];
    
    // if there are rows available in this section, go for next
    if (indexPath.row < rowCount) {
        
        // get the new index path
        NSIndexPath *newIndex = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        
        // call the focus
        [self focusIndexPath:newIndex];
        
        // exit the method
        return;
        
    }
    
    // there are no more rows availables ... check if there are sections available
    
    // get the section count
    NSInteger sectionCount = [self numberOfSections];
    
    // if there are sections availables, go for next section
    if (indexPath.section < sectionCount) {
        
        // get the new index path
        NSIndexPath *newIndex = [NSIndexPath indexPathForRow:0 inSection:indexPath.section+1];
        
        // call the focus
        [self focusIndexPath:newIndex];
        
        // exit the method
        return;
        
    }
    
    // if there are no more sections or rows available, exit
    return;
    
    
}

#pragma mark - Cell data handling
// refresh the data array with an updated cell
-(void)refreshDataFromCell:(tchEditFormTableCell*)cell{
    
    // skip if there is no property assigned
    if ([cell.propertyName isEqualToString:@""]) {return;}
    
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
