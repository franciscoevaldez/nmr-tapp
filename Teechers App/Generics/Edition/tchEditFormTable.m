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
    
    // create the data dictionary
    [self createFormDataDictionary];
    
}

-(void)setupCellArrayWithName:(NSString*)name
{
    // setup the url
    NSURL *file = [[NSBundle mainBundle] URLForResource:@"inputTables" withExtension:@"plist"];
    
    // create a dictionary with the contents
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfURL:file];
    
    // get the cell array from that plist dictionary
    NSArray *cellArray = [plistDict objectForKey:name];
    
    // pass it to the self
    self.formStruct = cellArray;
    
    
    // create the data dictionary
    [self createFormDataDictionary];
    
}

-(void)createFormDataDictionary
{
    
    // initialize a dummy dictionary
    NSMutableDictionary *dummyDictionary = [NSMutableDictionary dictionary];
    
    // loop through every item of the struct
    for (NSDictionary* currentRow in self.formStruct) {
        
        // if it is NOT an instruction
        if (![[currentRow valueForKey:@"cellType"]
             isEqualToString:@"tchFormCellInstruction"]) {
            
            // add the field to the dictionary
            [dummyDictionary setObject:@"void" forKey:[currentRow valueForKey:@"propertyName"]];
            
        }
        
        
    }
    
    // pass the new dictionary to the property
    self.formDataDict = dummyDictionary;
    
}

-(void)importDataFrom:(id)dataObject
{
    
    // Creando un diccionario temporal en la tabla de edit para que los form trabajen con eso en vez de con un managed object temporal. La idea es editar ese, que el data source levante los datos de ahí y que al aceptar el modal actualice la base de datos persistente.
    
    //NSString *key in [dmgr.CategoryDictionary allKeys]
    
    // loop through every data object key
    for (NSString *currentKey in [self.formDataDict allKeys]) {
    //for (id currentKey in self.formDataDict) {
        
        // get the data from the object
        [self.formDataDict setValue:[dataObject valueForKey:currentKey] forKey:currentKey];
        
        
    }
    
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
    
    // update the value in the temp dictionary
    [self.formDataDict setValue:newValue forKey:cell.propertyName];
    
    
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
