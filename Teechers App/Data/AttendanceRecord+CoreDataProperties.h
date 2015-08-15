//
//  AttendanceRecord+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 8/12/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "AttendanceRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttendanceRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *excused;
@property (nullable, nonatomic, retain) NSNumber *orderIndex;
@property (nullable, nonatomic, retain) NSNumber *status;
@property (nullable, nonatomic, retain) ClassDay *classDay;
@property (nullable, nonatomic, retain) Student *student;

@end

NS_ASSUME_NONNULL_END
