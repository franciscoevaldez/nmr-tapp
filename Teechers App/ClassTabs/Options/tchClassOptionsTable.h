//
//  tchClassOptionsTable.h
//  Teechers App
//
//  Created by fran on 8/19/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import "tchActionTableView.h"
#import "tchClassOptionsVC.h"
#import "AClass.h"

@interface tchClassOptionsTable : tchActionTableView

@property (strong,nonatomic) IBOutlet tchClassOptionsVC *optionsVC;
@property (strong,nonatomic) AClass *activeClass;

@end
