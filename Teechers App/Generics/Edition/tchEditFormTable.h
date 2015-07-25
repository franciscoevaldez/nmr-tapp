//
//  tchEditFormTable.h
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tchEditFormTableCell;
#import "tchEditFormTableCell.h"

@interface tchEditFormTable : UITableView

@property (strong,nonatomic) NSArray *cellsArray;
@property (strong,nonatomic) NSArray *dataArray;
@property (strong,nonatomic) id editableObject;

-(void)setupCellArray;
-(void)refreshDataFromCell:(tchEditFormTableCell*)cell;
-(void)refreshData;

@end
