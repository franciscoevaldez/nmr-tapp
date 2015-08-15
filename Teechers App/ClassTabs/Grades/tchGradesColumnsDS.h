//
//  tchGradesColumnsDS.h
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchColumnCollectionDataSource.h"

#import "AClass.h"

@interface tchGradesColumnsDS : tchColumnCollectionDataSource <tchColumnCollectionDSProtocol>

- (void)setupForStudent:(Student*)activeStudent;

@end
