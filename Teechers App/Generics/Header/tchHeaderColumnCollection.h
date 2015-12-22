//
//  tchHeaderColumnCollection.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchCollectionIndexed.h"

@protocol tchHeaderColumnsProtocol <NSObject>
- (void)setupForClass:(AClass*)activeClass;
@end

@protocol tchColumnCollectionDelegate <NSObject>
- (void)scrollToIndex:(NSInteger)newIndex;
@end



@interface tchHeaderColumnCollection : tchCollectionIndexed

@property (nonatomic, weak) IBOutlet id <tchColumnCollectionDelegate> columnDelegate;

@property (strong,nonatomic) AClass *activeClass;

- (void)setupForClass:(AClass*)activeClass;
- (void)columnWasSelected:(NSInteger)columnIndex;

@end
