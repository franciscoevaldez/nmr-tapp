//
//  AClass.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassDay, Evaluation, Student;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, tchExportType){
    tchExportTypePDF,
    tchExportTypeXLS,
    tchExportTypeCSV
};

@interface AClass : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

- (void)createAndStoreClassWithName:(NSString*)name institution:(NSString*)institution andStudents:(NSArray*)students;

- (void)createStudentWithName:(NSString*)studentName;
- (NSArray*)getStudentsSorted;

- (void)changeClassName:(NSString*)newName;

- (NSArray*)getDaysSorted;
- (NSInteger)getSortIndexForDay:(ClassDay*)classDay;
- (ClassDay*)getDayForIndex:(NSInteger)index;

- (ClassDay*)createNewDay:(NSDate*)date withName:(NSString*)name;


- (NSArray*)getEvaluationsSorted;
- (Evaluation*)getEvaluationForIndex:(NSInteger)index;
- (NSArray*)getEvalAbbreviations;

- (Evaluation*)createAndStoreNewEvaluation:(NSString*)name
                                    withID:(NSString*)newID
                                  maxGrade:(NSInteger)maxGrade
                                      date:(NSDate*)date;

-(NSString*)exportClassAsCSV;

@end

NS_ASSUME_NONNULL_END

#import "AClass+CoreDataProperties.h"
