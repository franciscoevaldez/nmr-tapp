//
//  AttendanceRecord.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassDay, Student;

@interface AttendanceRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * excused;
@property (nonatomic, retain) NSNumber * orderIndex;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) ClassDay *classDay;
@property (nonatomic, retain) Student *student;

@end
