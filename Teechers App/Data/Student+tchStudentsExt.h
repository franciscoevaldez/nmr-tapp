//
//  Student+tchStudentsExt.h
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "Student.h"
#import "AClass+tchAClassExt.h"

#import "AttendanceRecord.h"
#import "GradeRecord.h"

@interface Student (tchStudentsExt)

- (AttendanceRecord*)getAttendanceRecordForDay:(ClassDay*)classday;
- (AttendanceRecord*)getAttendanceRecordForIndex:(NSInteger)dayIndex;

- (GradeRecord*)getGradeForEvaluation:(Evaluation*)evaluation;

@end
