//
//  tchInputCollection.h
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student+tchStudentsExt.h"

@interface tchInputCollection : UICollectionView

-(void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;

@property (strong,nonatomic) Student *activeStudent;
@property (nonatomic) NSInteger *activeColumn;

@end
