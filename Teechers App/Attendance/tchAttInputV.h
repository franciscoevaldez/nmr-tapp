//
//  tchAttInputV.h
//  Teechers App
//
//  Created by fran on 5/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Student+tchStudentsExt.h"

@protocol tchInputProtocol <NSObject>

-(void)inputShouldDismiss;

@end

@interface tchAttInputV : UIView

@property (nonatomic, weak) id <tchInputProtocol> delegate;

- (void)setupForStudent:(Student*)student;
- (void)updateActiveColumn:(NSInteger)columnIndex;


@end
