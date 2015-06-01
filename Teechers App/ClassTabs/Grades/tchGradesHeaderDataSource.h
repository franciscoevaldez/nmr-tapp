//
//  tchGradesHeaderDataSource.h
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "tchHeaderColumnCollDataSource.h"

@interface tchGradesHeaderDataSource : NSObject <tchHeaderColumnsDataSource>

- (void)setupForClass:(AClass*)activeClass;

@end
