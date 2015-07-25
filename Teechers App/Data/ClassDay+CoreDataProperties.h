//
//  ClassDay+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "ClassDay.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassDay (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<AttendanceRecord *> *attendanceRecords;
@property (nullable, nonatomic, retain) AClass *forClass;

@end

@interface ClassDay (CoreDataGeneratedAccessors)

- (void)addAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)removeAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)addAttendanceRecords:(NSSet<AttendanceRecord *> *)values;
- (void)removeAttendanceRecords:(NSSet<AttendanceRecord *> *)values;

@end

NS_ASSUME_NONNULL_END
