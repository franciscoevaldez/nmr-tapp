//
//  tchGradeInputDataSource.h
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Evaluation.h"
#import "Student+tchStudentsExt.h"
#import "AClass+tchAClassExt.h"

@interface tchGradeInputDataSource : NSObject <UICollectionViewDataSource>

- (void)setupForStudent:(Student*)student columnIndex:(NSInteger)index;
@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) Evaluation *activeEvaluation;
@property (strong,nonatomic) Student *activeStudent;

@end
