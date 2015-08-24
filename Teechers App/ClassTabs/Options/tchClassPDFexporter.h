//
//  tchClassPDFexporter.h
//  Teechers App
//
//  Created by fran on 8/22/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AClass;

@interface tchClassPDFexporter : NSObject

-(NSString*)getPDFforClass:(AClass*)aClass;

@end
