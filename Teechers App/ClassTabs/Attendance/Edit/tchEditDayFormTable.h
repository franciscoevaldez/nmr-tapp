//
//  tchEditDayFormTable.h
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTable.h"

#import "AClass+tchAClassExt.h"
#import "ClassDay+tchClassDayExt.h"

@interface tchEditDayFormTable : tchEditFormTable

-(void)setupForClassDay:(ClassDay*)editableClassDay andClass:(AClass*)activeClass;

@end
