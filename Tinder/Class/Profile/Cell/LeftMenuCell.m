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
}
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *contentLabel;
@end
@implementation LeftMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithContent:(NSString *)content withIcon:(NSString *)iconStr{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor whiteColor];
        _content=content;
        _icon=iconStr;
        [self creatSubView];
    }
    
    return self;
}

-(void)creatSubView{
    [self addSubview:self.iconView];
    [self addSubview:self.contentLabel];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView=[[UIImageView alloc] initWithFrame:CGRectMake(19*SCREEN_RADIO, 11*SCREEN_RADIO, 21*SCREEN_RADIO, 23*SCREEN_RADIO)];
        _iconView.image=[UIImage imageNamed:[NSString stringWithFormat:@"ico-%@",_icon]];
    }
    
    return _iconView;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconView.frame)+34*SCREEN_RADIO, 15*SCREEN_RADIO, 0, 16*SCREEN_RADIO)];
        _contentLabel.text=_content;
        _contentLabel.textColor=[UIColor getColor:@"ffffff"];
        _contentLabel.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        [_contentLabel sizeToFit];
    }
    
    return _contentLabel;
}

@end
