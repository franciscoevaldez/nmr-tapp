//
//  tchGradesMenu.h
//  Teechers App
//
//  Created by fran on 20/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchDropMenuView.h"

@interface tchGradesMenu : tchDropMenuView <tchDropMenuProtocol>

@property (strong,nonatomic) IBOutlet UIButton *btnRemove;
@property (strong,nonatomic) IBOutlet UIButton *btnEdit;

@end
