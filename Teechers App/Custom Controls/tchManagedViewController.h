//
//  tchManagedViewController.h
//  Teechers App
//
//  Created by fran on 8/3/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"

@interface tchManagedViewController : UIViewController

@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong,nonatomic) AClass *activeClass;

@end
