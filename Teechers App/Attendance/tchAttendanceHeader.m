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
    
}

#pragma mark - handling swipes
- (void)swipeDoneLeft{
    
    NSInteger dayCount = [[self.activeClass.classDays allObjects] count];
    
    if (self.activeDayIndex < (dayCount-1)) {
        
        [self performDayScrollToIndex:self.activeDayIndex+1];
        
    }
    
}

- (void)swipeDoneRight{
    
    if (self.activeDayIndex>0) {
        
        [self performDayScrollToIndex:self.activeDayIndex-1];
        
    }
    
}

- (void)performDayScrollToIndex:(NSInteger)newIndex{
    
    // create a new index path
    NSIndexPath *indexForScroll = [NSIndexPath indexPathForRow:newIndex inSection:0];
    
    // perform the scroll
    [self.dayCollection scrollToItemAtIndexPath:indexForScroll atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // store the new index to the property
    self.activeDayIndex = newIndex;
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
