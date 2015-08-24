//
//  tchActionTableCell.h
//  Teechers App
//
//  Created by fran on 8/18/15.
//  Copyright © 2015 nmr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tchActionTableCell : UITableViewCell

@property (strong,nonatomic) NSString *cellType;
@property (strong,nonatomic) NSIndexPath *indexPath;

@property (strong,nonatomic) IBOutlet UILabel *cellLabel;

- (void)setupCellWithStruct:(NSDictionary*)structData andIndexPath:(NSIndexPath*)indexPath;

@end
