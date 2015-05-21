//
//  tchGradesVC.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "tchGradesHeader.h"
#import "tchEditGrade1VC.h"

#import "AClass+tchAClassExt.h"

@interface tchGradesVC : UIViewController <tchHeaderDelegate, tchEditDialogDelegate>

@property (strong,nonatomic) AClass *activeClass;

@end
