//
//  Student.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "AClass.h"
#import "AttendanceRecord.h"

@class AClass, AttendanceRecord, GradeRecord, StudentPicture, StudentSummary, ClassDay, Evaluation;

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

- (AttendanceRecord*)getAttendanceRecordForDay:(ClassDay*)classday;
- (AttendanceRecord*)getAttendanceRecordForIndex:(NSInteger)dayIndex;

- (void)createAttendanceRecordAtDay:(ClassDay*)classDay withStatus:(tchAttendanceStatus)status andOrderIndex:(NSInteger)index;
- (BOOL)toggleExcusedAtDay:(ClassDay*)classDay withIndex:(NSInteger)dayIndex;

- (GradeRecord*)getGradeForEvaluation:(Evaluation*)evaluation;

- (void)setGradeRecordForEvaluation:(Evaluation*)evaluation withGrade:(NSInteger*)grade andOrderIndex:(NSInteger)index;

-(void)changeStudentNameTo:(NSString*)newName;

- (void)deleteStudent;

@end

NS_ASSUME_NONNULL_END

#import "Student+CoreDataProperties.h"
