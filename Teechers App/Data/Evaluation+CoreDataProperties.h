//
//  Evaluation+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Evaluation.h"

NS_ASSUME_NONNULL_BEGIN

@interface Evaluation (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *minToPass;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *nameShort;
@property (nullable, nonatomic, retain) NSNumber *range;
@property (nullable, nonatomic, retain) NSString *rules;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSData *valuesLong;
@property (nullable, nonatomic, retain) NSData *valuesShort;
@property (nullable, nonatomic, retain) AClass *forClass;
@property (nullable, nonatomic, retain) NSSet<GradeRecord *> *gradeRecords;

@end

@interface Evaluation (CoreDataGeneratedAccessors)

- (void)addGradeRecordsObject:(GradeRecord *)value;
- (void)removeGradeRecordsObject:(GradeRecord *)value;
- (void)addGradeRecords:(NSSet<GradeRecord *> *)values;
- (void)removeGradeRecords:(NSSet<GradeRecord *> *)values;

@end

NS_ASSUME_NONNULL_END
