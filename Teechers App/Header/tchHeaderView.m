//
//  tchHeaderView.m
//  Teechers App
//
//  Created by fran on 19/5/15.
//  Copyright (c) 2015 nmr. All rights reserved.
//

#import "tchHeaderView.h"
#import "UIColor+appColorPresets.h"

@interface tchHeaderView ()
@end


@implementation tchHeaderView

#pragma mark - Header Setup
- (void)setupHeaderForClass:(AClass*)classForHeader{
    
    /*
    // call collection view controller to get ready
    [self.tchHeaderDaysDataSource setupForClass:classForHeader];
    
    // pass class object from method to header object
    self.activeClass = classForHeader;
    
    // write class name in label
    self.classNameLabel.text = classForHeader.name;
    */
    
}

#pragma mark - Default initialization
- (void)defaultInit{
    
    // initialize column index
    self.activeColumnIndex = 0;
    
    // header starts not highlighted
    self.isHighlighted = FALSE;
    
}


#pragma mark - Scroll handling
- (void)performColumnScrollToIndex:(NSInteger)newIndex{
    
    if (!self.columnCollection) {
        return;
    }
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self.columnCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeColumnIndex = newIndex;
    
}


#pragma mark - Column Reloading
- (void)reloadData{
    
    if (!self.columnCollection) {
        return;
    }
    
    // tell collection view to reload data
    [self.columnCollection reloadData];
    [self.columnCollection reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}


#pragma mark - Menu Reaction
- (void)menuWasToggled{
    
    // if menu is closed
    if (!self.isHighlighted) {
        
        // darken background color
        //UIColor *darkerColor = [UIColor colorWithRed:(35/255.0) green:(90/255.0) blue:(172/255.0) alpha:1.0f];
        //self.layer.backgroundColor = darkerColor.CGColor;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.layer.backgroundColor = [UIColor tchBlueMedium].CGColor;
        }];
        
        // change deploy indicator
        self.deployIndicator.image = [UIImage imageNamed:@"Deployed - white"];
        
        // lighten collection view
        self.columnCollection.layer.opacity = 0.25f;
        
        // change the value
        self.isHighlighted = !self.isHighlighted;
        
    } else {
        
        // go back to original color
        //UIColor *originalColor = [UIColor colorWithRed:(60/255.0) green:(160/255.0) blue:(203/255.0) alpha:1.0f];
        //self.layer.backgroundColor = originalColor.CGColor;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.layer.backgroundColor = [UIColor tchBlueLight].CGColor;
        }];
        
        // change deploy indicator
        self.deployIndicator.image = [UIImage imageNamed:@"Deployable - white"];
        
        // collection view back to full swing
        self.columnCollection.layer.opacity = 1.0f;
        
        // change toggled value
        self.isHighlighted = !self.isHighlighted;
        
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
