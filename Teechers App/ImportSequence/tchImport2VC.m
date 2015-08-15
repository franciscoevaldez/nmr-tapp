//
//  tchImport2VC.m
//  Teechers App
//
//  Created by fran on 4/21/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchImport2VC.h"

#import "AClass.h"
#import "tchEditFormTable.h"

@interface tchImport2VC ()

@property (strong,nonatomic) IBOutlet tchEditFormTable *formTable;

@end

@implementation tchImport2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // tell the form table to set its containers
    [self.formTable setupCellArrayWithName:@"newClass"];
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    // reload the form
    [self.formTable reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"toConfirmationStep"]) {
        
        // create the new class object
        AClass *aNewClass = [NSEntityDescription insertNewObjectForEntityForName:@"AClass" inManagedObjectContext:self.managedObjectContext];
        
        // setup the class with the values
        [aNewClass createAndStoreClassWithName:[self.formTable.formDataDict valueForKey:@"name"] institution:[self.formTable.formDataDict valueForKey:@"institution"] andStudents:self.studentsData];
        
        
        // pass managed object context to confirmation
        tchManagedViewController *nextViewController = [segue destinationViewController];
        nextViewController.managedObjectContext = self.managedObjectContext;
        
        
    }
    
}


@end
