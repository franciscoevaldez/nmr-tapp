//
//  tchEditFormTableCell.h
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tchDatePickerField.h"

@class tchEditFormTable;
#import "tchEditFormTable.h"

// definition of available celltypes
typedef NS_ENUM(NSInteger, tchFormCellType) {
    tchFormCellLabelAndTextInput,
    tchFormCellLabelAndDateInput,
    tchFormCellLabelAndNumberInput,
    tchFormCellInstruction
};

@interface tchEditFormTableCell : UITableViewCell <UITextFieldDelegate>

@property (strong,nonatomic) IBOutlet tchEditFormTable *ownerTable;

@property (nonatomic) tchFormCellType cellType;
@property (nonatomic) NSString *labelText;
@property (nonatomic) NSString *inputPlaceholder;
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic) NSString *propertyName;
@property (nonatomic) NSString *inputDefault;

@property (nonatomic) id value;

@property (strong,nonatomic) IBOutlet UILabel *inputLabel;
@property (strong,nonatomic) IBOutlet UITextField *inputField;
@property (strong,nonatomic) IBOutlet tchDatePickerField *datePickerField;
@property (strong,nonatomic) IBOutlet UILabel *separatorLabel;

- (void)setupCellWithStruct:(NSDictionary*)structData data:(id)data andIndexPath:(NSIndexPath*)indexPath;
//- (void)setupCell:(tchEditFormTableCell*)cellData;
- (void)refreshCellValue:(id)cell;

- (void)getFocus;


- (NSString*)getCellTypeString;


@end
