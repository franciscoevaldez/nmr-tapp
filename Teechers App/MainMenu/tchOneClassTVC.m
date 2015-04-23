//
//  tchOneClassTVC.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchOneClassTVC.h"

@interface tchOneClassTVC ()

@property (strong, nonatomic) IBOutlet UILabel *classNameLabel;


@end

@implementation tchOneClassTVC

- (void)awakeFromNib {
    // Initialization code
}

// setup the cell
- (void)setupCellForClass:(AClass*)classForThisCell{
    
    // pass the class to the cell
    self.classInCell = classForThisCell;
    
    // set the label
    self.classNameLabel.text = self.classInCell.name;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
