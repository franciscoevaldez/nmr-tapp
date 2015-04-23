//
//  tchStudentDeployableTVC.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentDeployableTVC.h"

@interface tchStudentDeployableTVC ()

@property (strong, nonatomic) IBOutlet UILabel *studentNameLabel;

@end

@implementation tchStudentDeployableTVC

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


// handling highlight


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    // Deselect in the end
    [super setSelected:NO animated:YES];
}

@end
