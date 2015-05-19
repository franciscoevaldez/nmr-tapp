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



@interface tchHeaderColumnCollection : tchCollectionIndexed

@property (strong,nonatomic) AClass *activeClass;
- (void)setupForClass:(AClass*)activeClass;

@end
