//
//  tchClassTableDS.m
//  Teechers App
//
//  Created by fran on 4/22/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchClassTableDS.h"
#import "AClass.h"
#import "tchOneClassTVC.h"

@interface tchClassTableDS ()

@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation tchClassTableDS

#pragma mark - Fetch classes

-(void)setupClasses:(NSManagedObjectContext*)managedObjectContext{
    
    // get classes stored in core data
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    self.managedObjectContext = managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AClass" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    self.classesArray = results;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger cellNumber = 1;
    
    if (section==0) {
        cellNumber = [self.classesArray count];
    }
    
    // Number of rows is the number of classes in the array
    return cellNumber;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // if this is the last cell, create and "add class" cell instead of a standard one
    if (indexPath.section == 1) {
        
        // create the cell
        UITableViewCell *addNewCell = [tableView dequeueReusableCellWithIdentifier:@"addClassCell"];
        
        // if this is the first time the app is run, show the other add class cell
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        if (! [defaults boolForKey:@"firstClassShown"]) {
            
            // change the cell type
            addNewCell = [tableView dequeueReusableCellWithIdentifier:@"addFirstClassCell"];
            
            [defaults setBool:YES forKey:@"firstClassShown"];
        }
        
        [defaults setBool:NO forKey:@"firstClassShown"];
        
        // return it
        return addNewCell;
        
    }
    
    // create the new cell
    tchOneClassTVC *newCell = [tableView dequeueReusableCellWithIdentifier:@"aClassCell"];
    
    // get the class for this new cell
    AClass *currentClass = [self.classesArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForClass:currentClass];
    
    return newCell;
    
}

@end
