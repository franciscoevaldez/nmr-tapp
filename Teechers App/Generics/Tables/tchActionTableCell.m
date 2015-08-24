//
//  tchActionTableCell.m
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableCell.h"

@implementation tchActionTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellWithStruct:(NSDictionary*)structData
               andIndexPath:(NSIndexPath*)indexPath
{
    
    // get the cell type
    self.cellType = [structData objectForKey:@"cellType"];
    
    // setup the indexpath
    self.indexPath = indexPath;
    
    // setup the cell label
    if (self.cellLabel) {
        self.cellLabel.text = [structData objectForKey:@"labelText"];
    }
    
    
}


@end
