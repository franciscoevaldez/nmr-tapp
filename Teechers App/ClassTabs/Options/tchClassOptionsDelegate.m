//
//  tchClassOptionsDelegate.m
//  Teechers App
//
//  Created by fran on 8/19/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchClassOptionsDelegate.h"
#import "tchClassOptionsVC.h"
#import "AClass.h"

@implementation tchClassOptionsDelegate

- (void)tableView:(tchActionTableView*)tableView runAction:(NSString*)action{
    
    // get the active class
    tchClassOptionsTable *castedTable = (tchClassOptionsTable*)tableView;
    tchClassOptionsVC *viewController = castedTable.optionsVC;

    if ([action isEqualToString:@"toExportAsXLS"]) {
        //[viewController callExportClassAs:tchClassExportTypeCSV];
        [viewController callExport];
    }
    
    if ([action isEqualToString:@"toExportAsPDF"]) {
        [viewController callExportPDF];
    }
    
    if ([action isEqualToString:@"toRenameClass"]) {
        [viewController callChangeName];
    }
    
    if ([action isEqualToString:@"toAddStudent"]) {
        [viewController callAddStudent];
    }

}

- (IBAction)pdfExportPressed:(id)sender {
    
    [self tableView:self.ownerTable runAction:@"toExportAsPDF"];
    
}

- (IBAction)xlsExportPressed:(id)sender {
    
    [self tableView:self.ownerTable runAction:@"toExportAsXLS"];
    
}

@end
