//
//  StudentSummary.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface StudentSummary : NSManagedObject

@property (nonatomic, retain) NSNumber * attAbsents;
@property (nonatomic, retain) NSNumber * attLates;
@property (nonatomic, retain) NSNumber * attPercentage;
@property (nonatomic, retain) NSNumber * attTotal;
@property (nonatomic, retain) NSNumber * attWarning;
@property (nonatomic, retain) NSNumber * grdFailed;
@property (nonatomic, retain) NSNumber * grdPassed;
@property (nonatomic, retain) NSNumber * grdPercentage;
@property (nonatomic, retain) NSNumber * grdTotal;
@property (nonatomic, retain) NSNumber * grdWarning;
@property (nonatomic, retain) Student *forStudent;

@end
