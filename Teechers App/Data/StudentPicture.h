//
//  StudentPicture.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface StudentPicture : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) Student *forStudent;

@end
