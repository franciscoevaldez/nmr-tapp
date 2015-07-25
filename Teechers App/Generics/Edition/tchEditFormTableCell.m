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
    
    // get the cell type
    self.cellType = cellData.cellType;
    
    // setup the indexpath
    self.indexPath = cellData.indexPath;
    
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
    
    // setup the value
    if (cellData.value) {
        
        // get it to the property
        self.value = cellData.value;
        
        // write it on the input
        if (self.cellType == tchFormCellLabelAndDateInput) {
            [self.datePickerField changeDatePicker:self.value];
        }
        
        if (self.cellType == tchFormCellLabelAndTextInput) {
            self.inputField.text = [NSString stringWithFormat:@"%@", self.value];
        }
        
    }
    
    
}

// from selection focus the input
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

// return the cell type
- (NSString*)getCellTypeString{
    
    NSArray *cellTypesArray = [NSArray arrayWithObjects:@"tchFormCellLabelAndTextInput",
                               @"tchFormCellLabelAndDateInput",
                               @"tchFormCellLabelAndNumberInput",
                               @"tchFormCellInstruction", nil];
    
    return cellTypesArray[self.cellType];
    
}

- (void)refreshCellValue:(id)cell{
    
    // if the class is a date picker
    if (self.cellType == tchFormCellLabelAndDateInput) {
        
        self.value = self.datePickerField.pickedDate;
        
    } else if (self.cellType == tchFormCellLabelAndTextInput) {
        
        self.value = self.inputField.text;
        
    }
    
}

// input the cell value when the input has done editing
- (IBAction)inputEditEnded:(id)sender {
    
    if ([sender isKindOfClass:[tchDatePickerField class]]) {
        
        tchDatePickerField *castedPicker = (tchDatePickerField*)sender;
        self.value = castedPicker.pickedDate;
        
    } else if ([sender isKindOfClass:[UITextField class]]) {
        
        UITextField *castedInput = (UITextField*)sender;
        self.value = castedInput.text;
        
    }
    
    // tell the table to update the values
    [self.ownerTable refreshDataFromCell:self];
    
}




@end
