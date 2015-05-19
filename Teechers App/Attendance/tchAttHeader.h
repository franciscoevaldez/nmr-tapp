//
//  tchAttHeader.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchHeaderView.h"

@interface tchAttHeader : tchHeaderView <tchHeaderViewProtocol>

- (void)setupHeaderForClass:(AClass*)classForHeader;

@end
