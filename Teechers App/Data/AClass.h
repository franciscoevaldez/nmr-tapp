//
//  AClass.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassDay, Evaluation, Student;

@interface AClass : NSManagedObject

@property (nonatomic, retain) NSData * classColor;
@property (nonatomic, retain) NSString * classID;
@property (nonatomic, retain) NSDate * dateEnd;
@property (nonatomic, retain) NSDate * dateStart;
@property (nonatomic, retain) NSString * institution;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *classDays;
@property (nonatomic, retain) NSSet *evaluations;
@property (nonatomic, retain) NSSet *students;
@end

@interface AClass (CoreDataGeneratedAccessors)

- (void)addClassDaysObject:(ClassDay *)value;
- (void)removeClassDaysObject:(ClassDay *)value;
- (void)addClassDays:(NSSet *)values;
- (void)removeClassDays:(NSSet *)values;

- (void)addEvaluationsObject:(Evaluation *)value;
- (void)removeEvaluationsObject:(Evaluation *)value;
- (void)addEvaluations:(NSSet *)values;
- (void)removeEvaluations:(NSSet *)values;

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
