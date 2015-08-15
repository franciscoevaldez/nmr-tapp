//
//  tchAttendanceColumnVC.h
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AttendanceRecord.h"
#import "ClassDay.h"

@interface tchAttendanceColumnVC : UICollectionViewCell

@property (strong,nonatomic) AttendanceRecord *currentRecord;
- (void) setupForRecord:(AttendanceRecord*)record orDate:(ClassDay*)classDay;
- (void) tempSetup:(NSInteger)currentIndex;

@end
