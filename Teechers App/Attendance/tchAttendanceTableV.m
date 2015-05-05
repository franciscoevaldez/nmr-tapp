//
//  tchAttendanceTableV.m
//  Teechers App
//
//  Created by fran on 2/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceTableV.h"
#import "tchAttendanceColumnVC.h"
#import "tchAttendanceTableDS.h"
#import "tchStudentDataTVC.h"

@interface tchAttendanceTableV ()

@property (assign,nonatomic) NSInteger currentColumnIndex;
@property (strong,nonatomic) IBOutlet tchAttendanceTableDS *attendanceTableDS;

@end

@implementation tchAttendanceTableV

#pragma mark - handling cell scroll
- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // tell every cell to skip to the new index
    NSArray *visibleCells = [self visibleCells];
    
    // loop through every cell
    for (tchStudentDataTVC *currentColumn in visibleCells) {
        
        // tell each one to scroll
        [currentColumn performDayScrollToIndex:newIndex];
        
    }
    
    // store the new index to the property
    self.currentColumnIndex = newIndex;
    
    // tell the attendance data source the new index
    self.attendanceTableDS.currentScrollIndex = self.currentColumnIndex;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
