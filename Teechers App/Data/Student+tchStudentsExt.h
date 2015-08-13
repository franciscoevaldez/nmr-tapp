//
//  Student+tchStudentsExt.h
//  Teechers App
//
//  Created by fran on 1/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "Student.h"
#import "AClass+tchAClassExt.h"

#import "ClassDay+tchClassDayExt.h"
#import "Evaluation+tchEvalExt.h"
#import "StudentSummary.h"

#import "AttendanceRecord+tchAttExt.h"
#import "GradeRecord.h"

@interface Student (tchStudentsExt)

- (AttendanceRecord*)getAttendanceRecordForDay:(ClassDay*)classday;
- (AttendanceRecord*)getAttendanceRecordForIndex:(NSInteger)dayIndex;

- (void)createAttendanceRecordAtDay:(ClassDay*)classDay withStatus:(tchAttendanceStatus)status andOrderIndex:(NSInteger)index;
- (BOOL)toggleExcusedAtDay:(ClassDay*)classDay withIndex:(NSInteger)dayIndex;

- (GradeRecord*)getGradeForEvaluation:(Evaluation*)evaluation;

- (void)setGradeRecordForEvaluation:(Evaluation*)evaluation withGrade:(NSInteger*)grade andOrderIndex:(NSInteger)index;

@end
