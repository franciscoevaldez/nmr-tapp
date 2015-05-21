//
//  tchEditGrade1VC.h
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "tchFormViewController.h"
#import "Evaluation.h"

@protocol tchEditDialogDelegate <NSObject>

- (void)editGradeWasDismissed:(Evaluation*)changedDay;

@end

@interface tchEditGrade1VC : tchFormViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <tchEditDialogDelegate> delegate;

@property (strong, nonatomic) AClass *activeClass;
@property (strong, nonatomic) Evaluation *evaluationToEdit;

@end
