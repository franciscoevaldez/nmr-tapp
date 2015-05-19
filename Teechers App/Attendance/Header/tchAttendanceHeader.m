//
//  tchAttendanceHeader.m
//  Teechers App
//
//  Created by fran on 4/23/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchAttendanceHeader.h"
#import "tchAttHeadDaysColDS.h"

@interface tchAttendanceHeader ()

@property (strong,nonatomic) IBOutlet UILabel *classNameLabel;
@property (strong,nonatomic) IBOutlet tchAttHeadDaysColDS * tchHeaderDaysDataSource;

@property (strong,nonatomic) IBOutlet UICollectionView *dayCollection;
@property (assign,nonatomic) NSInteger activeDayIndex;

@property (assign,nonatomic) BOOL menuIsDeployed;

@property (strong,nonatomic) IBOutlet UIImageView *deployIndicator;

@end

@implementation tchAttendanceHeader


- (void)setupHeaderForClass:(AClass*)classForHeader{
        
    // call collection view controller to get ready
    [self.tchHeaderDaysDataSource setupForClass:classForHeader];
    
    // pass class object from method to header object
    self.activeClass = classForHeader;
    
    // write class name in label
    self.classNameLabel.text = classForHeader.name;
    
    // initialize day index:
    self.activeDayIndex = 0;
    
    // menu starts undeployed
    self.menuIsDeployed = NO;
    
}


- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self.dayCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeDayIndex = newIndex;
    
}

#pragma mark - reload collection's data
- (void)reloadData{
    
    // tell collection view to reload data
    [self.dayCollection reloadData];
    [self.dayCollection reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}

#pragma mark - touch event
- (IBAction)touchUpInside{
    
    // tell delegate (view controller)
    if ([_delegate respondsToSelector:@selector(headerWasTapped)]) {
        [_delegate headerWasTapped];
    }
    
}


#pragma mark - menu reaction
- (void)menuWasToggled{
    
    // if menu is closed
    if (!self.menuIsDeployed) {
        
        // darken background color
        UIColor *darkerColor = [UIColor colorWithRed:(35/255.0) green:(90/255.0) blue:(172/255.0) alpha:1.0f];
        //self.layer.backgroundColor = darkerColor.CGColor;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.layer.backgroundColor = darkerColor.CGColor;
        }];
        
        // change deploy indicator
        self.deployIndicator.image = [UIImage imageNamed:@"Deployed - white"];
        
        // lighten collection view
        self.dayCollection.layer.opacity = 0.25f;
        
        // change the value
        self.menuIsDeployed = !self.menuIsDeployed;
        
    } else {
        
        // go back to original color
        UIColor *originalColor = [UIColor colorWithRed:(60/255.0) green:(160/255.0) blue:(203/255.0) alpha:1.0f];
        //self.layer.backgroundColor = originalColor.CGColor;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.layer.backgroundColor = originalColor.CGColor;
        }];
        
        // change deploy indicator
        self.deployIndicator.image = [UIImage imageNamed:@"Deployable - white"];
        
        // collection view back to full swing
        self.dayCollection.layer.opacity = 1.0f;
        
        // change toggled value
        self.menuIsDeployed = !self.menuIsDeployed;
        
    }
    
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
