//
//  tchGradeInputView.m
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchGradeInputView.h"

@implementation tchGradeInputView

- (void)inputWasSelected:(NSIndexPath *)indexPath{
    
    // get the item that was selected (index path row as grade)
    NSInteger newMark = indexPath.row + 1;
    
    // get the active class
    AClass* activeClass = self.activeStudent.inClass;
    
    // get the active day from active index
    Evaluation* activeEvaluation = [activeClass getEvaluationForIndex:self.activeColumn];
    
    // tell the store coordinator to save the index
    [self.storeCoordinator createGradeRecordForStudent:self.activeStudent
                                         forEvaluation:activeEvaluation
                                             withGrade:&newMark
                                         andOrderIndex:self.activeColumn];

    
    // cell whould dismiss after that
    [self.delegate cellShouldDismiss];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
