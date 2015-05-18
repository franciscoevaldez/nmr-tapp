//
//  UIColor+appColorPresets.m
//  Teechers App
//
//  Created by fran on 18/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "UIColor+appColorPresets.h"

@implementation UIColor (appColorPresets)

/*
 
 + (UIColor *)aquaColor {
 return [UIColor colorWithHueDegrees:210 saturation:1.0 brightness:1.0];
 }
 
 */

+ (UIColor *)tchTextColor {
    return [UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:1.0f];
}

+ (UIColor *)tchRed {
    return [UIColor colorWithRed:(217.0/255.0) green:(58.0/255.0) blue:(53.0/255.0) alpha:1.0f];
}

+ (UIColor *)tchGreen {
    return [UIColor colorWithRed:(49.0/255.0) green:(146.0/255.0) blue:(107.0/255.0) alpha:1.0f];
}

+ (UIColor *)tchYellow {
    return [UIColor colorWithRed:(227.0/255.0) green:(168.0/255.0) blue:(19.0/255.0) alpha:1.0f];
}

@end
