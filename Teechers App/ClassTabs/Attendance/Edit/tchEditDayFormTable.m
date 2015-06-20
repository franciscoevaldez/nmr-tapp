//
//  tchEditDayFormTable.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditDayFormTable.h"

#import "tchEditFormTableCell.h"

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
