//
//  tchEditDayVC.h
//  Teechers App
//
//  Created by fran on 28/4/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AClass.h"
#import "ClassDay.h"

@protocol tchEditDayVCDelegate <NSObject>

- (void)editDayWasDismissed:(ClassDay*)changedDay;

@end

@interface tchEditDayVC : UIViewController

@property (nonatomic, weak) id <tchEditDayVCDelegate> delegate;
@property (strong, nonatomic) AClass *activeClass;
@property (strong, nonatomic) ClassDay *dayToEdit;

@end
