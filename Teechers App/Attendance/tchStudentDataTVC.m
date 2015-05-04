//
//  tchStudentDataTVC.m
//  Teechers App
//
//  Created by fran on 4/24/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentDataTVC.h"

#import "tchStudentAttendanceDS.h"

@interface tchStudentDataTVC ()

@property (strong,nonatomic) IBOutlet UILabel *studentNameLabel;
@property (strong,nonatomic) IBOutlet tchStudentAttendanceDS *columnDataSource;
@property (strong,nonatomic) IBOutlet UICollectionView *columnCollection;

@property (assign,nonatomic) NSInteger activeColumn;

@end

@implementation tchStudentDataTVC

- (void)awakeFromNib {
    // Initialization code
}


// setup cell taking the student
- (void)setupCellForStudent:(Student*)student atScrollIndex:(NSInteger)scrollIndex{
    
    // pass the student to the cell
    self.studentForCell = student;
    
    // set the label
    self.studentNameLabel.text = self.studentForCell.name;
    
    // set up the columns data source
    [self.columnDataSource setupForStudent:student];
    [self.columnCollection reloadData];
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:scrollIndex inSection:0];
    
    // perform the scroll
    [self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeColumn = scrollIndex;
    
    
    
}


#pragma mark - Handling column scroll
- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeColumn = newIndex;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
