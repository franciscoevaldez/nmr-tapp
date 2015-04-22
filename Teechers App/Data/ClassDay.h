//
//  ClassDay.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AClass, AttendanceRecord;

@interface ClassDay : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * dayID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *attendanceRecords;
@property (nonatomic, retain) AClass *forClass;
@end

@interface ClassDay (CoreDataGeneratedAccessors)

- (void)addAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)removeAttendanceRecordsObject:(AttendanceRecord *)value;
- (void)addAttendanceRecords:(NSSet *)values;
- (void)removeAttendanceRecords:(NSSet *)values;

@end
