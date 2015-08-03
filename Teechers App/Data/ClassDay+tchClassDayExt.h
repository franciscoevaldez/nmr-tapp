//
//  ClassDay+tchClassDayExt.h
//  Teechers App
//
//  Created by fran on 31/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "ClassDay.h"

@interface ClassDay (tchClassDayExt)

- (ClassDay*)updateDayWithDate:(NSDate*)date name:(NSString*)name;
- (void)deleteClassDay;

@end
