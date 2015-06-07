//
//  AttendanceRecord+tchAttExt.h
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "AttendanceRecord.h"

/*
#define tchAttendanceRecPresent @"P"
#define tchAttendanceRecAbsent @"A"
#define tchAttendanceRecLate @"L"
#define tchAttendanceRecExcusedYES TRUE
#define tchAttendanceRecExcusedNO FALSE
 */

typedef NS_ENUM(NSInteger, tchAttendanceStatus){
    tchAttendancePresent,
    tchAttendanceAbsent,
    tchAttendanceLate
};

typedef NS_ENUM(NSInteger, tchAttendanceExcused){
    tchAttendanceExcusedNo = 0,
    tchAttendanceExcusedYes = 1
};

@interface AttendanceRecord (tchAttExt)

@end
