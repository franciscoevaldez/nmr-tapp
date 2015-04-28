//
//  tchClassTableDS.h
//  Teechers App
//
//  Created by fran on 4/22/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface tchClassTableDS : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *classesArray;
-(void)setupClasses:(NSManagedObjectContext*)managedObjectContext;

@end
