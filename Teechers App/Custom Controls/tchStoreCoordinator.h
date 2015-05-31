//
//  tchStoreCoordinator.h
//  Teechers App
//
//  Created by fran on 29/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AClass+tchAClassExt.h"
#import "Student+tchStudentsExt.h"

@interface tchStoreCoordinator : NSObject

@property (strong,nonatomic) AClass *activeClass;

- (ClassDay*)createAndStoreNewDay:(NSDate*)date withName:(NSString*)name;
- (ClassDay*)updateAndStoreDay:(ClassDay*)classDayToUpdate withDate:(NSDate*)date withName:(NSString*)name;
- (void)deleteClassDay:(ClassDay*)classDayToDelete;

- (void)createAttendanceRecordForStudent:(Student*)student
                                   atDay:(ClassDay*)classDay
                              withStatus:(NSString*)status
                           andOrderIndex:(NSInteger)index;

- (BOOL)toggleExcusedForStudent:(Student*)student
                          atDay:(ClassDay*)classDay
                      withIndex:(NSInteger)dayIndex;


- (Evaluation*)createAndStoreNewEvaluation:(NSString*)name
                                    withID:(NSString*)newID
                                  maxGrade:(int)maxGrade
                                      date:(NSDate*)date;

- (void)createGradeRecordForStudent:(Student*)student
                      forEvaluation:(Evaluation*)evaluation
                          withGrade:(NSInteger*)grade
                      andOrderIndex:(NSInteger)index;

@end
