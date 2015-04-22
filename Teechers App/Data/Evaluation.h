//
//  Evaluation.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AClass, GradeRecord;

@interface Evaluation : NSManagedObject

@property (nonatomic, retain) NSString * gradeID;
@property (nonatomic, retain) NSNumber * minToPass;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * range;
@property (nonatomic, retain) NSString * rules;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSData * valuesLong;
@property (nonatomic, retain) NSData * valuesShort;
@property (nonatomic, retain) AClass *forClass;
@property (nonatomic, retain) NSSet *gradeRecords;
@end

@interface Evaluation (CoreDataGeneratedAccessors)

- (void)addGradeRecordsObject:(GradeRecord *)value;
- (void)removeGradeRecordsObject:(GradeRecord *)value;
- (void)addGradeRecords:(NSSet *)values;
- (void)removeGradeRecords:(NSSet *)values;

@end
