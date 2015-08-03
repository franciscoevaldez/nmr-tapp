//
//  tchInputCollection.h
//  Teechers App
//
//  Created by fran on 22/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student+tchStudentsExt.h"

@protocol tchInputCollectionDelegate <NSObject>

- (void)inputWasSelected:(NSIndexPath*)indexPath;

@end

@interface tchInputCollection : UICollectionView

@property (nonatomic, weak) IBOutlet id <tchInputCollectionDelegate> inputDelegate;

-(void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;

- (void)itemWasSelected:(NSIndexPath*)indexPath;

@property (strong,nonatomic) Student *activeStudent;
@property (nonatomic) NSInteger *activeColumn;

@end
