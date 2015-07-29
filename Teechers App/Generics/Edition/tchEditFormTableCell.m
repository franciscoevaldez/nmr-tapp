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

- (void)setupCellWithStruct:(NSDictionary*)structData
                       data:(id)data
               andIndexPath:(NSIndexPath*)indexPath
{
    
    // get the cell type
    NSString *cellTypeString = [structData objectForKey:@"cellType"];
    self.cellType = [self getCellTypeFromString:cellTypeString];

    // get the property for this cell
    self.propertyName = [structData objectForKey:@"propertyName"];
    
    // setup the indexpath
    self.indexPath = indexPath;
    
    // setup the cell label
    if (self.inputLabel) {
        self.inputLabel.text = [structData objectForKey:@"labelText"];
    }
    
    // setup the input placeholder
    if (self.inputField) {
        self.inputField.placeholder = [structData objectForKey:@"inputPlaceholder"];
        self.inputField.text = @"";
    }
    
    // setup the date field
    if (self.datePickerField) {
        self.datePickerField.placeholder = [structData objectForKey:@"inputPlaceholder"];
        self.inputField.text = @"";
    }
    
    
    // setup the value
    if (data) {
        
        // get it to the property
        self.value = data;
        
        // write it on the input
        if (self.cellType == tchFormCellLabelAndDateInput) {
            [self.datePickerField changeDatePicker:self.value];
        }
        
        if (self.cellType == tchFormCellLabelAndTextInput) {
            self.inputField.text = [NSString stringWithFormat:@"%@", self.value];
        }
        
        if (self.cellType == tchFormCellLabelAndNumberInput) {
            self.inputField.text = [NSString stringWithFormat:@"%@", self.value];
        }

        
    }
    
    // if the cell is an instruction, disable selection
    if (self.cellType == tchFormCellInstruction) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
}

// from selection focus the input
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        [self getFocus];
    }
    
}

// recieving focus
- (void)getFocus{
    
    // if it has an input field, select it
    if (self.inputField) {
        [self.inputField becomeFirstResponder];
    }
    
    // if it has a date picker input, select it
    if (self.datePickerField) {
        [self.datePickerField becomeFirstResponder];
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

// cell type from string
- (tchFormCellType)getCellTypeFromString:(NSString*)string
{
    
    if ([string isEqualToString:@"tchFormCellLabelAndTextInput"]) {
        return tchFormCellLabelAndTextInput;
    }
    
    if ([string isEqualToString:@"tchFormCellLabelAndDateInput"]) {
        return tchFormCellLabelAndDateInput;
    }
    
    if ([string isEqualToString:@"tchFormCellLabelAndNumberInput"]) {
        return tchFormCellLabelAndNumberInput;
    }
    
    if ([string isEqualToString:@"tchFormCellInstruction"]) {
        return tchFormCellInstruction;
    }
    
    
    return tchFormCellLabelAndTextInput;
}

- (void)refreshCellValue:(id)cell{
    
    // update the value according to the cell type
    switch (self.cellType) {
        case tchFormCellLabelAndTextInput:
            self.value = self.inputField.text;
            break;
            
        case tchFormCellLabelAndDateInput:
            self.value = self.datePickerField.pickedDate;
            break;
            
        case tchFormCellLabelAndNumberInput:
            self.value = [NSNumber numberWithInteger:[self.inputField.text integerValue]];
            break;
            
        case tchFormCellInstruction:
            self.value = nil;
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Input handling

// input the cell value when the input has done editing
- (IBAction)inputEditEnded:(id)sender {
    
    // refresh the cell value
    [self refreshCellValue:self];
    
    // tell the table to update the values
    [self.ownerTable refreshDataFromCell:self];
    
}

// enter has been pressed on the input
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // resign first responder
    [textField resignFirstResponder];
    
    // call the end of the edition
    [self inputEditEnded:self];
    
    // tell the cell to select the next cell
    [self.ownerTable focusFollowingCell:self];
    
    return NO;
}



@end
