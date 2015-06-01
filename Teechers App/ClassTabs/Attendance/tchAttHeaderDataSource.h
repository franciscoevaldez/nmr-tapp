//
//  tchAttHeaderDataSource.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchHeaderColumnCollDataSource.h"

@interface tchAttHeaderDataSource : tchHeaderColumnCollDataSource <tchHeaderColumnsDataSource>

- (void)setupForClass:(AClass*)activeClass;

@end
