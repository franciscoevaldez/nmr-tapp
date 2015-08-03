//
//  StudentPicture+CoreDataProperties.h
//  Teechers App
//
//  Created by fran on 7/25/15.
//  Copyright © 2015 nmr. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "StudentPicture.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentPicture (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) Student *forStudent;

@end

NS_ASSUME_NONNULL_END
