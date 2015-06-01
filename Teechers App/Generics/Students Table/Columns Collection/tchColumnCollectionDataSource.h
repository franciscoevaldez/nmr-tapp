//
//  tchColumnCollectionDataSource.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Student+tchStudentsExt.h"

@protocol tchColumnCollectionDSProtocol <UICollectionViewDataSource>

@required
- (void)setupForStudent:(Student*)activeStudent;

@end



@interface tchColumnCollectionDataSource : NSObject <UICollectionViewDataSource>

@property (strong,nonatomic) Student *activeStudent;

- (void)setupForStudent:(Student*)activeStudent;

@end
