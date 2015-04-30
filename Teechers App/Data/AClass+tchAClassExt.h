//
//  AClass+tchAClassExt.h
//  Teechers App
//
//  Created by fran on 30/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "AClass.h"

@interface AClass (tchAClassExt)

- (NSArray*)getDaysSorted;
- (NSInteger)getSortIndexForDay:(ClassDay*)classDay;

//@property (retain, nonatomic) NSArray *daysSortedArray;

@end
