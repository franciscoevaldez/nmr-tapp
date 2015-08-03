//
//  tchEditEvalFormTable.h
//  Teechers App
//
//  Created by fran on 7/26/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditFormTable.h"

#import "AClass+tchAClassExt.h"
#import "Evaluation+tchEvalExt.h"


@interface tchEditEvalFormTable : tchEditFormTable

-(void)setupForEditableObject:(Evaluation*)editableObject inClass:(AClass*)activeClass;

@end
