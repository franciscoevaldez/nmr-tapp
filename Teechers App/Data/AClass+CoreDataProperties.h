//
//  AClass+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "AClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface AClass (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *classColor;
@property (nullable, nonatomic, retain) NSDate *dateEnd;
@property (nullable, nonatomic, retain) NSDate *dateStart;
@property (nullable, nonatomic, retain) NSString *institution;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ClassDay *> *classDays;
@property (nullable, nonatomic, retain) NSSet<Evaluation *> *evaluations;
@property (nullable, nonatomic, retain) NSSet<Student *> *students;

@end

@interface AClass (CoreDataGeneratedAccessors)

- (void)addClassDaysObject:(ClassDay *)value;
- (void)removeClassDaysObject:(ClassDay *)value;
- (void)addClassDays:(NSSet<ClassDay *> *)values;
- (void)removeClassDays:(NSSet<ClassDay *> *)values;

- (void)addEvaluationsObject:(Evaluation *)value;
- (void)removeEvaluationsObject:(Evaluation *)value;
- (void)addEvaluations:(NSSet<Evaluation *> *)values;
- (void)removeEvaluations:(NSSet<Evaluation *> *)values;

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet<Student *> *)values;
- (void)removeStudents:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
