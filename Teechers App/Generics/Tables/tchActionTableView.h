//
//  tchActionTableView.h
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchActionTableView : UITableView

// name property for picking up the cell data from the plist
@property (strong,nonatomic) NSString *tablePlistID;
// cell struct
@property (strong,nonatomic) NSArray *cellStruct;

-(void)setupCellArray;

@end
