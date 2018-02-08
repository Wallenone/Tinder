//
//  UICustomProfileTextView.h
//  Tinder
//
//  Created by wallen on 2018/2/8.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^UpdateHeightBlock)(CGFloat height);
@interface UICustomProfileTextView : UITextView
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIFont *placeholderFont;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) CGFloat leftMarggin;
@property (nonatomic, assign) CGFloat topMarggin;
@property (nonatomic, assign) NSInteger maxNum;
@property (nonatomic, assign) BOOL hiddenMaxState;
- (instancetype)initWithFrame:(CGRect)frame withUpdateHeight:(UpdateHeightBlock)block;
-(void)reloadViews;
@end
