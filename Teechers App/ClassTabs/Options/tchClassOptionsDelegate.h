//
//  tchClassOptionsDelegate.h
//  Teechers App
//
//  Created by fran on 8/19/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableView.h"
#import "tchActionTableDelegate.h"
#import "tchClassOptionsTable.h"

@interface tchClassOptionsDelegate : tchActionTableDelegate

@property (strong,nonatomic) IBOutlet tchClassOptionsTable* ownerTable;

@end
