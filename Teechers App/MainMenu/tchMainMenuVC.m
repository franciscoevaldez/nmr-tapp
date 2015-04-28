//
//  tchMainMenuVC.m
//  Teechers App
//
//  Created by fran on 4/20/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchMainMenuVC.h"
#import "AClass.h"
#import "tchClassTableDS.h"

#import "tchImport1VC.h"
#import "tchClassTabBarVC.h"
#import "tchOneClassTVC.h"

@interface tchMainMenuVC ()
@property (strong, nonatomic) IBOutlet tchClassTableDS *tchClassTableDataSource;

@end

@implementation tchMainMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    // before the view loads
    
    // tell the class table data source to setup itself
    [self.tchClassTableDataSource setupClasses:self.managedObjectContext];
    
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
    if ([[segue identifier]isEqualToString:@"toAddAClass"]) {
        
        tchImport1VC *destinationVC = [segue destinationViewController];
        destinationVC.managedObjectContext = self.managedObjectContext;
        
    }
    
    // Segue to class tab controller
    if ([[segue identifier]isEqualToString:@"toClassTabController"]) {
        
        // get the selected class from the cell
        tchOneClassTVC *selectedCell = sender;
        
        tchClassTabBarVC *destinationVC = [segue destinationViewController];
        destinationVC.activeClass = selectedCell.classInCell;
        
    }
    
}

// unwind to main menu function
-(IBAction)prepareForUnwindToMainMenu:(UIStoryboardSegue *)segue {
    
}


@end
