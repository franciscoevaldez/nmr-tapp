//
//  tchEditGrade1VC.m
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchEditGrade1VC.h"
#import "tchEditFormTable.h"

@interface tchEditGrade1VC ()

@property (strong, nonatomic) IBOutlet tchEditFormTable *formTable;
@property (strong,nonatomic) NSArray *usedNamesArray;

@end

@implementation tchEditGrade1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // tell the form table to set its containers
    [self.formTable setupCellArrayWithName:@"evaluationEdit"];
    
    // if there is a class to edit, change the view title
    if (self.evaluationToEdit) {
        
        // change the title
        self.titleLabel.text = @"Edit grade";
        
        // import data
        [self.formTable importDataFrom:self.evaluationToEdit];
        
    }
    
    // register keyboard notifications
    [self registerForKeyboardNotifications];
    
    // reload the form
    [self.formTable reloadData];
    
    // give the focus to the first input
    [self.formTable focusIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Cancelation & confirmation
- (IBAction)dismissVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

    [_delegate editGradeWasDismissed:nil];
    
}

#pragma mark - confirm view
- (IBAction)confirmVC:(id)sender {
    
    // get the current date object from table
    [self.formTable refreshData];
    
    // get the value array
    NSDictionary *valueArray = self.formTable.formDataDict;
    
    // if there is not a day to edit, create a new day
    if (!self.evaluationToEdit) {
        
        // create the class day with the values
        self.evaluationToEdit = [self.activeClass createAndStoreNewEvaluation:[valueArray valueForKey:@"name"] withID:[valueArray valueForKey:@"nameShort"] maxGrade:[[valueArray valueForKey:@"range"] integerValue] date:[valueArray valueForKey:@"date"]];
        
    } else {
        
        // update the values for the day to edit
        [self.evaluationToEdit updateEvaluation:[valueArray valueForKey:@"name"] withShortName:[valueArray valueForKey:@"nameShort"] date:[valueArray valueForKey:@"date"] range:[valueArray valueForKey:@"range"]];
        
    }
    
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // pass the new day to the delegate
    [_delegate editGradeWasDismissed:self.evaluationToEdit];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
