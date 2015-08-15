//
//  AttendanceRecord.h
//  Teechers App
//
//  Created by fran on 8/12/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassDay, Student;

typedef NS_ENUM(NSInteger, tchAttendanceStatus){
    tchAttendancePresent,
    tchAttendanceAbsent,
    tchAttendanceLate
};

typedef NS_ENUM(NSInteger, tchAttendanceExcused){
    tchAttendanceExcusedNo = 0,
    tchAttendanceExcusedYes = 1
};

NS_ASSUME_NONNULL_BEGIN

@interface AttendanceRecord : NSManagedObject

// Insert code here to declare functionality of your managed object subclass


@end

NS_ASSUME_NONNULL_END

#import "AttendanceRecord+CoreDataProperties.h"
