//
//  tchEditDayFormTable.m
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchEditDayFormTable.h"
#import "tchEditFormTableCell.h"
#import "tchEditDayFormTableDS.h"

@implementation tchEditDayFormTable

// cell for getting the cell array
-(void)setupCellArray
{
    
    // setup the url
    NSURL *file = [[NSBundle mainBundle] URLForResource:@"tchAttendancePL" withExtension:@"plist"];
    
    // create a dictionary with the contents
    NSArray *plistDict = [NSArray arrayWithContentsOfURL:file];
    
    // pass it to the self
    self.formStruct = plistDict;

}

-(void)setupForClassDay:(ClassDay*)editableClassDay andClass:(AClass*)activeClass
{
    
    // if the class day is nil, create one
    if (!editableClassDay) {
        
        // init the class day object
        ClassDay *newClassDay = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"ClassDay"
                                 inManagedObjectContext:activeClass.managedObjectContext];

        // set the class it relates to
        [newClassDay setValue:activeClass forKey:@"forClass"];
        
        // set the editable to the new day
        editableClassDay = newClassDay;
        
    }
    
    // get the editable day to the table property
    self.editableObject = editableClassDay;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
