//
//  tchInputView.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Student+tchStudentsExt.h"
#import "tchStoreCoordinator.h"

@protocol tchInputViewProtocol <NSObject>

@required

- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)setupDelegate:(id)delegate;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end


@protocol tchInputDelegateProtocol <NSObject>

-(void)cellShouldDismiss;

@end



@interface tchInputView : UIView

@property (nonatomic, weak) IBOutlet id <tchInputDelegateProtocol> delegate;

@property (nonatomic,strong) IBOutlet UICollectionView *inputCollection;
@property (strong,nonatomic) IBOutlet tchStoreCoordinator *storeCoordinator;

@property (nonatomic,strong) Student *activeStudent;
@property (nonatomic,assign) NSInteger activeColumn;

- (void)setupForStudent:(Student*)student andColumn:(NSInteger)columnIndex;
- (void)setupDelegate:(id)delegate;
- (void)updateActiveColumn:(NSInteger)columnIndex;

@end
