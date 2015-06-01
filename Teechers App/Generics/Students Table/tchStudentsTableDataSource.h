//
//  tchStudentsTableDataSource.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AClass+tchAClassExt.h"

@interface tchStudentsTableDataSource : NSObject <UITableViewDataSource>

- (void)setupForClass:(AClass*)activeClass;

@property (assign,nonatomic) NSInteger currentScrollIndex;

@end
