//
//  tchClassImporter.h
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchClassImporter : NSObject


// managed context object
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
// students names (unified names & surnames for now)
@property (strong, nonatomic) NSArray *studentsArray;
// class name
@property (strong, nonatomic) NSString *theNewClassName;
// institution name
@property (strong, nonatomic) NSString *institutionName;

// importing magic method
-(void)parseAndSaveANewClass;

@end
