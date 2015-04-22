//
//  Student.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AClass, AttendanceRecord, GradeRecord, StudentPicture, StudentSummary;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * studentID;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSSet *attendanceRecords;
@property (nonatomic, retain) NSSet *gradeRecords;
@property (nonatomic, retain) AClass *inClass;
@property (nonatomic, retain) StudentPicture *picture;
@property (nonatomic, retain) StudentSummary *summaryRecord;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)removeAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)addAttendanceRecords:(NSSet *)values;
- (void)removeAttendanceRecords:(NSSet *)values;

- (void)addGradeRecordsObject:(GradeRecord *)value;
- (void)removeGradeRecordsObject:(GradeRecord *)value;
- (void)addGradeRecords:(NSSet *)values;
- (void)removeGradeRecords:(NSSet *)values;

@end
