//
//  tchEditEvalFormTable.m
//  Teechers App
//
//  Created by fran on 7/26/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditEvalFormTable.h"

@implementation tchEditEvalFormTable

-(void)setupForEditableObject:(Evaluation*)editableObject inClass:(AClass*)activeClass
{
    
    // if the class day is nil, create one
    if (!editableObject) {
        
        // init the class day object
        Evaluation *newClassDay = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"Evaluation"
                                   inManagedObjectContext:activeClass.managedObjectContext];
        
        // set the class it relates to
        [newClassDay setValue:activeClass forKey:@"forClass"];
        
        // set the editable to the new day
        editableObject = newClassDay;
        
    }
    
    // get the editable day to the table property
    self.editableObject = editableObject;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
