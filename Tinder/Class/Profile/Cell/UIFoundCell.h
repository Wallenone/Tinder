//
//  UINoLikeTableViewCell.h
//  Tinder
//
//  Created by wallen on 2018/2/24.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFoundCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withModel:(NSArray *)model;
@end
