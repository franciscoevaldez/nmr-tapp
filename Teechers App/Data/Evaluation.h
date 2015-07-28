//
//  Evaluation.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AClass, GradeRecord;

NS_ASSUME_NONNULL_BEGIN

@interface Evaluation : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
- (Evaluation*)updateEvaluation:(NSString*)name withShortName:(NSString*)shortName date:(NSDate*)date range:(NSNumber*)range;

- (void)deleteEval;
- (NSInteger)getSortingIndex;

@end

NS_ASSUME_NONNULL_END

#import "Evaluation+CoreDataProperties.h"
