//
//  tchActionTableView.m
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableView.h"

@implementation tchActionTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setupCellArray
{
    // setup the url
    NSURL *file = [[NSBundle mainBundle] URLForResource:@"appTables" withExtension:@"plist"];
    
    // create a dictionary with the contents
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfURL:file];
    
    // get the cell array from that plist dictionary
    NSArray *cellArray = [plistDict objectForKey:self.tablePlistID];
    
    // pass it to the self
    self.cellStruct = cellArray;
    
}

@end
