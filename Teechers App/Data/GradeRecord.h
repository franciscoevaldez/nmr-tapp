//
//  GradeRecord.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evaluation, Student;

@interface GradeRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * grade;
@property (nonatomic, retain) NSString * gradeLong;
@property (nonatomic, retain) NSString * gradeShort;
@property (nonatomic, retain) NSNumber * orderIndex;
@property (nonatomic, retain) NSNumber * passed;
@property (nonatomic, retain) NSNumber * percentage;
@property (nonatomic, retain) Evaluation *forClass;
@property (nonatomic, retain) Student *forStudent;

@end
