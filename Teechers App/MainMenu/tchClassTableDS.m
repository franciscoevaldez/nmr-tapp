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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Number of rows is the number of classes in the array
    return [self.classesArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // create the new cell
    tchOneClassTVC *newCell = [tableView dequeueReusableCellWithIdentifier:@"aClassCell"];
    
    // get the class for this new cell
    AClass *currentClass = [self.classesArray objectAtIndex:indexPath.row];
    
    // setup the cell
    [newCell setupCellForClass:currentClass];
    
    return newCell;
    
}

@end
