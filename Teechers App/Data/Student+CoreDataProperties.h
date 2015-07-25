//
//  Student+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *surname;
@property (nullable, nonatomic, retain) NSSet<AttendanceRecord *> *attendanceRecords;
@property (nullable, nonatomic, retain) NSSet<GradeRecord *> *gradeRecords;
@property (nullable, nonatomic, retain) AClass *inClass;
@property (nullable, nonatomic, retain) StudentPicture *picture;
@property (nullable, nonatomic, retain) StudentSummary *summaryRecord;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)removeAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)addAttendanceRecords:(NSSet<AttendanceRecord *> *)values;
- (void)removeAttendanceRecords:(NSSet<AttendanceRecord *> *)values;

- (void)addGradeRecordsObject:(GradeRecord *)value;
- (void)removeGradeRecordsObject:(GradeRecord *)value;
- (void)addGradeRecords:(NSSet<GradeRecord *> *)values;
- (void)removeGradeRecords:(NSSet<GradeRecord *> *)values;

@end

NS_ASSUME_NONNULL_END
