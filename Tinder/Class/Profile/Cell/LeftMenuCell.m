//
//  LeftMenuCell.m
//  Tinder
//
//  Created by wallen on 2018/1/10.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "LeftMenuCell.h"
@interface LeftMenuCell(){
    NSString *_content;
    NSString *_icon;
    CGFloat _iconWidth;
    CGFloat _iconHeight;
}
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *contentLabel;
@end
@implementation LeftMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithModel:(NSDictionary *)model{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor clearColor];
        _content=[model stringForKey:@"text"];
        _icon=[model stringForKey:@"icon"];
        _iconWidth=[model floatForKey:@"width"];
        _iconHeight=[model floatForKey:@"height"];
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 245*SCREEN_RADIO, 45*SCREEN_RADIO)];
        self.selectedBackgroundView = view;
        CAGradientLayer *gradient = [CGCommonString setChangColorWithView:view andColorStart:[UIColor getColor:@"E87975"] andEndColor:[UIColor getColor:@"F3C7A1"]];
        [view.layer insertSublayer:gradient above:0];
        gradient.cornerRadius=8;
        
        
        [self creatSubView];
    }
    
    return self;
}


- (void)setFrame:(CGRect)frame{
    frame.origin.x += 0;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}


-(void)creatSubView{
    //[self addSubview:self.iconView];
    [self addSubview:self.contentLabel];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView=[[UIImageView alloc] initWithFrame:CGRectMake(19*SCREEN_RADIO, 11*SCREEN_RADIO, _iconWidth, _iconHeight)];
        _iconView.image=[UIImage imageNamed:_icon];
    }
    
    return _iconView;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(44*SCREEN_RADIO, 12*SCREEN_RADIO, 0, 18*SCREEN_RADIO)];
        _contentLabel.text=_content;
        _contentLabel.textColor=[UIColor getColor:@"ffffff"];
        _contentLabel.font=[UIFont systemFontOfSize:18*SCREEN_RADIO];
        [_contentLabel sizeToFit];
    }
    
    return _contentLabel;
}

@end
