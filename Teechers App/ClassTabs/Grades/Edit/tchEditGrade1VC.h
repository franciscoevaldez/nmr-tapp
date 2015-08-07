//
//  tchEditGrade1VC.h
//  Teechers App
//
//  Created by fran on 21/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchViewKeyboardVC.h"

#import "tchFormViewController.h"
#import "tchDatePickerField.h"

#import "AClass+tchAClassExt.h"
#import "Evaluation+tchEvalExt.h"

@protocol tchEditDialogDelegate <NSObject>

- (void)editGradeWasDismissed:(Evaluation*)changedDay;

@end

@interface tchEditGrade1VC : tchViewKeyboardVC <UITextFieldDelegate>

@property (nonatomic, weak) id <tchEditDialogDelegate> delegate;

@property (strong, nonatomic) AClass *activeClass;
@property (strong, nonatomic) Evaluation *evaluationToEdit;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

/*
@property (strong, nonatomic) IBOutlet UITextField *nameInput;
@property (strong, nonatomic) IBOutlet UITextField *shortInput;
@property (strong, nonatomic) IBOutlet UITextField *maxGradeInput;
@property (strong, nonatomic) IBOutlet tchDatePickerField *dateInput;
*/
@end
