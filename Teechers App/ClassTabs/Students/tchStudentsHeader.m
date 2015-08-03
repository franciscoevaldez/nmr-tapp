//
//  tchStudentsHeader.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchStudentsHeader.h"

@interface tchStudentsHeader ()

@property (strong,nonatomic) AClass *activeClass;
@property (strong,nonatomic) IBOutlet UILabel *classNameLabel;

@end

@implementation tchStudentsHeader


- (void)setupHeaderForClass:(AClass*)classForHeader{
    
    // pass class object from method to header object
    self.activeClass = classForHeader;
    
    // write class name in label
    self.classNameLabel.text = classForHeader.name;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
