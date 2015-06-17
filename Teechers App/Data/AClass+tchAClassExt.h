//
//  AClass+tchAClassExt.h
//  Teechers App
//
//  Created by fran on 30/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "AClass.h"

#import "ClassDay+tchClassDayExt.h"

@interface AClass (tchAClassExt)

- (NSArray*)getDaysSorted;
- (NSInteger)getSortIndexForDay:(ClassDay*)classDay;
- (ClassDay*)getDayForIndex:(NSInteger)index;

- (ClassDay*)createNewDay:(NSDate*)date withName:(NSString*)name;


- (NSArray*)getEvaluationsSorted;
- (Evaluation*)getEvaluationForIndex:(NSInteger)index;

- (Evaluation*)createAndStoreNewEvaluation:(NSString*)name
                                    withID:(NSString*)newID
                                  maxGrade:(NSInteger)maxGrade
                                      date:(NSDate*)date;

@end
