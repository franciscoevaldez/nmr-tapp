//
//  Student.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AClass, AttendanceRecord, GradeRecord, StudentPicture, StudentSummary;

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Student+CoreDataProperties.h"
