//
//  tchAttendanceInputTVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceInputTVC.h"

@interface tchAttendanceInputTVC ()

@property (strong, nonatomic) IBOutlet UILabel *studentNameLabel;

@end

@implementation tchAttendanceInputTVC

- (void)awakeFromNib {
    // Initialization code
}

// setup cell taking the student
- (void)setupCellForStudent:(Student*)student{
    
    // pass the student to the cell
    self.studentForCell = student;
    
    // set the label
    self.studentNameLabel.text = self.studentForCell.name;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
