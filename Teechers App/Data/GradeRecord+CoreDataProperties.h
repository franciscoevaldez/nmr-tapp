//
//  GradeRecord+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "GradeRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface GradeRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *grade;
@property (nullable, nonatomic, retain) NSString *gradeLong;
@property (nullable, nonatomic, retain) NSString *gradeShort;
@property (nullable, nonatomic, retain) NSNumber *orderIndex;
@property (nullable, nonatomic, retain) NSNumber *passed;
@property (nullable, nonatomic, retain) NSNumber *percentage;
@property (nullable, nonatomic, retain) Evaluation *forClass;
@property (nullable, nonatomic, retain) Student *forStudent;

@end

NS_ASSUME_NONNULL_END
