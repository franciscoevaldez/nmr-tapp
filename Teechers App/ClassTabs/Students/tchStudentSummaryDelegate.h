//
//  tchStudentSummaryDelegate.h
//  Teechers App
//
//  Created by fran on 9/12/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "tchStudentsVC.h"

@interface tchStudentSummaryDelegate : NSObject <UITableViewDelegate>

@property (strong,nonatomic) IBOutlet tchStudentsVC *ownerViewController;

@end
