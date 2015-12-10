//
//  tchListViewController.m
//  Teechers App
//
//  Created by fran on 31/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchListViewController.h"

@interface tchListViewController ()

@end

@implementation tchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self reloadViewsData];
    
    [self performInitialScroll];
    
    if (self.optionsMenu) {
        self.optionsMenu.heightConstraint.constant = 0.0;
    }
    
}

#pragma mark - Scroll when loading
-(void)performInitialScroll{
    
    // make sure there is an initial offset
    if (self.initialScrollOffset.y) {
        
        // perform the scroll
        [self.studentsTable setContentOffset:self.initialScrollOffset animated:NO];
        
    }
}

#pragma mark - Edition Handling
-(void)checkEditionEnable{}

#pragma mark - Data distribution
-(void)setupForClass:(AClass*)activeClass{
    
    // Tell the students table to setup itself
    if (self.studentsTable) {
        [self.studentsTable setupForClass:self.activeClass];
    }
    
    // Setup the header for this class
    if (self.headerView) {
        [self.headerView setupHeaderForClass:self.activeClass];
    }
    
    // Setup the menu for this class
    if (self.optionsMenu) {
        [self.optionsMenu setupForClass:self.activeClass];
    }
    
}

-(void)reloadViewsData {
    
    // if edition is enabled, enable the table
    [self checkEditionEnable];
    if (self.editionEnabled) {
        self.studentsTable.alpha = 1;
        self.studentsTable.isEnabled = true;
    } else {
        self.studentsTable.alpha = 0.3;
        self.studentsTable.isEnabled = false;
    }
    
    // refresh the students table
    if (self.studentsTable) {
        [self.studentsTable reloadAllData];
    }
    
    // refresh the header data source
    if (self.headerView) {
        [self.headerView reloadData];
    }
    
    // refresh the menu
    if (self.optionsMenu) {
        [self.optionsMenu reloadData];
    }

    
}


#pragma mark - Menu Handling
-(void)headerWasTapped {
    
    // if menu is not open...
    if (!self.optionsMenu.status) {
        
        // ...deploy it
        [self optionsMenuDeploy];
        
    } else {
        
        // ...otherwise close it
        [self optionsMenuClose];
        
    }
    
}

-(void)optionsMenuDeploy {
    
    // check if menu is actually not open
    if (!self.optionsMenu.status) {
        
        [self.studentsTable enableTableNewStatus:false];
        
        // show the table
        self.optionsMenu.hidden = false;
        
        
        // animate to the new height
        self.optionsMenu.columnBandCollection.hidden = false;
        [UIView animateWithDuration:0.2 delay:0.15 options:UIViewAnimationOptionCurveLinear animations:^{
            self.optionsMenu.columnBandCollection.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.optionsMenu.heightConstraint.constant = self.optionsMenu.heightForFullDeploy;
            [self.view layoutIfNeeded];
            
            self.studentsTable.alpha = 0.3;
            
        } completion:^(BOOL finished) {
            self.optionsMenu.columnBandCollection.hidden = false;
            
            // show the band collection
            [UIView animateWithDuration:0.2 animations:^{
                self.optionsMenu.columnBandCollection.alpha = 1;
            }];
            
        }];
        
        // tell the menu and the header to update its properties
        [self.optionsMenu toggleMenu];
        [self.headerView menuWasToggled];
        
    }
    
}

-(void)optionsMenuClose {
    
    // check if menu is actually not open
    if (self.optionsMenu.status != tchMenuIsHidden) {
        
        // hide the column band
        [UIView animateWithDuration:0.2 delay:0.15 options:UIViewAnimationOptionCurveLinear animations:^{
            self.optionsMenu.columnBandCollection.alpha = 0;
        } completion:^(BOOL finished) {
            self.optionsMenu.columnBandCollection.hidden = true;
        }];
        
        // animate to the new height
        [UIView animateWithDuration:0.5 animations:^{
            self.optionsMenu.heightConstraint.constant = 0;
            [self.view layoutIfNeeded];
            
            if (self.editionEnabled) {self.studentsTable.alpha = 1;}
            
        } completion:^(BOOL finished) {
            
            // actually hide the menu
            self.optionsMenu.hidden = true;
            
        }];
        
        if (self.editionEnabled) {[self.studentsTable enableTableNewStatus:true];}
        
        // tell the menu and the header to update its properties
        [self.optionsMenu toggleMenu];
        [self.headerView menuWasToggled];
        
        
    }
    
}

-(void)snapMenuClosed
{
    // hide the menu
    self.optionsMenu.hidden = true;
    
    // hide the column band
    self.optionsMenu.columnBandCollection.alpha = 0;
    self.optionsMenu.columnBandCollection.hidden = true;
    
}


#pragma mark - Column Handling
-(NSInteger)getMaxScroll{
    return 0;
}


-(IBAction)swipeLeftDone:(id)sender {
    
    
    NSInteger maxScroll = [self getMaxScroll];
    
    if (self.currentColumnIndex < (maxScroll-1)
        && (!self.optionsMenu.status)
        && (!self.studentsTable.thereIsACellDeployed)){
        
        [self scrollToIndex:self.currentColumnIndex+1];
        
    }
    
}

-(IBAction)swipeRightDone:(id)sender {
    
    // check the scroll is available
    if (self.currentColumnIndex > 0
        && (!self.optionsMenu.status)
        && (!self.studentsTable.thereIsACellDeployed)) {
        
        [self scrollToIndex:self.currentColumnIndex-1];
        
    }
    
}

-(void)scrollToIndex:(NSInteger)newIndex{
    
    
    // if you get a -1 as index, that means scroll to the previous column
    if (newIndex == -1) {
        newIndex = self.currentColumnIndex-1;
    }
    
    // now, if the current scroll is -1, normalize to 0
    newIndex = (newIndex<0) ? 0 : newIndex;
    
    // if the scroll index
    
    // Tell header to scroll to new index
    //[self.tchAttendanceHeader performDayScrollToIndex:newIndex];
    [self.headerView performColumnScrollToIndex:newIndex];
    
    // Tell the table to perform the scroll
    [self.studentsTable performDayScrollToIndex:newIndex];
    
    // If menu is deployed, close it
    [self optionsMenuClose];
    
    // get the new index to VC property
    self.currentColumnIndex = newIndex;
    
}



#pragma mark - Warnings
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
