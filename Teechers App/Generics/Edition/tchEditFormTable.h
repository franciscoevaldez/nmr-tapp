//
//  tchEditFormTable.h
//  Teechers App
//
//  Created by fran on 20/6/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchEditFormTable : UITableView

@property (strong,nonatomic) NSArray *cellsArray;

-(void)setupCellArray;

@end
