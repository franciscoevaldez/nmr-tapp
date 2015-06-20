//
//  tchEditFormTableCell.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTableCell.h"

@implementation tchEditFormTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setupCell:(tchEditFormTableCell*)cellData
{
    
    // setup the cell label
    if (self.inputLabel) {
        self.inputLabel.text = cellData.labelText;
    }
    
    // setup the input placeholder
    if (self.inputField) {
        self.inputField.placeholder = cellData.inputPlaceholder;
        self.inputField.text = @"";
    }
    
    // setup the date field
    if (self.datePickerField) {
        self.datePickerField.placeholder = cellData.inputPlaceholder;
        self.inputField.text = @"";
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        
        // if it has an input field, select it
        if (self.inputField) {
            [self.inputField becomeFirstResponder];
        }
        
        // if it has a date picker input, select it
        if (self.datePickerField) {
            [self.datePickerField becomeFirstResponder];
        }
        
    }
    
}

- (NSString*)getCellTypeString{
    
    NSArray *cellTypesArray = [NSArray arrayWithObjects:@"tchFormCellLabelAndTextInput",
                               @"tchFormCellLabelAndDateInput",
                               @"tchFormCellLabelAndNumberInput",
                               @"tchFormCellInstruction", nil];
    
    return cellTypesArray[self.cellType];
    
}





@end
