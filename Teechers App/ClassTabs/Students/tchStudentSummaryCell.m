//
//  tchStudentSummaryCell.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentSummaryCell.h"
#import "tchStudentSummaryTable.h"

@interface tchStudentSummaryCell ()

@property (strong,nonatomic) IBOutlet tchStudentSummaryTable *summaryTable;

@end

@implementation tchStudentSummaryCell

- (void)awakeFromNib {
    // Initialization code
}

// setup cell taking the student
- (void)setupCellForStudent:(Student*)student
              atScrollIndex:(NSInteger)scrollIndex
              withIndexPath:(NSIndexPath*)indexPath
                andDelegate:(id)tableView{
    
    // pass the student to the cell
    self.studentForCell = student;
    
    // set the label
    self.studentNameLabel.text = self.studentForCell.name;
    
    // tell the table view to set itself up for the student
    [self.summaryTable setupForStudent:student];
    [self.summaryTable reloadData];
    
    // set the table as delegate of this cell
    self.delegate = tableView;
    
}


// handling highlight


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    // Deselect in the end
    [super setSelected:NO animated:YES];
}

@end
