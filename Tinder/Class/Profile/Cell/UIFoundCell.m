//
//  UINoLikeTableViewCell.m
//  Tinder
//
//  Created by wallen on 2018/2/24.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UIFoundCell.h"
@interface UIFoundCell()
@property(nonatomic,strong)UIView *cellcontentView;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UIImageView *videoIcon;
@property(nonatomic,strong)UIView *userView;
@property(nonatomic,strong)UIImageView *userImgIcon;
@property(nonatomic,strong)UILabel *userNickName;
@property(nonatomic,strong)UILabel *userContentLabel;
@property(nonatomic,strong)UIImageView *userPersonImgView;
@property(nonatomic,strong)UILabel *userPersonLabel;
@end
@implementation UIFoundCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withModel:(NSArray *)model{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor getColor:@"262834"];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self creatSubView];
    }
    
    return self;
}

-(void)creatSubView{
    [self addSubview:self.cellcontentView];
    [self.cellcontentView addSubview:self.imgView];
    [self.cellcontentView addSubview:self.videoIcon];
    [self.cellcontentView addSubview:self.userView];
    [self.userView addSubview:self.userImgIcon];
    [self.userView addSubview:self.userNickName];
    [self.userView addSubview:self.userContentLabel];
    [self.userView addSubview:self.userPersonImgView];
    [self.userView addSubview:self.userPersonLabel];
}

-(UIView *)cellcontentView{
    if (!_cellcontentView) {
        _cellcontentView=[[UIView alloc] initWithFrame:CGRectMake(6*SCREEN_RADIO, 6*SCREEN_RADIO, SCREEN_WIDTH-12*SCREEN_RADIO, 278*SCREEN_RADIO)];
        _cellcontentView.backgroundColor=[UIColor clearColor];
        _cellcontentView.layer.cornerRadius=5;
    }
    
    return _cellcontentView;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-12*SCREEN_RADIO, 278*SCREEN_RADIO)];
        _imgView.layer.cornerRadius=5;
        _imgView.clipsToBounds=YES;
        _imgView.image=[UIImage imageNamed:@"1"];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _imgView;
}

-(UIImageView *)videoIcon{
    if (!_videoIcon) {
        _videoIcon=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-56*SCREEN_RADIO, 10*SCREEN_RADIO, 40*SCREEN_RADIO, 40*SCREEN_RADIO)];
        _videoIcon.image=[UIImage imageNamed:@"found_videoicon"];
    }
    
    return _videoIcon;
}

-(UIView *)userView{
    if (!_userView) {
        _userView=[[UIView alloc] initWithFrame:CGRectMake(0, 228*SCREEN_RADIO, SCREEN_WIDTH-12*SCREEN_RADIO, 50*SCREEN_RADIO)];
        CAGradientLayer *gradient = [CGCommonString setChangColorWithView:_userView andColorArrs:@[(__bridge id)[UIColor getColor:@"635546"].CGColor,(__bridge id)[UIColor getColor:@"4D4641"].CGColor,(__bridge id)[UIColor getColor:@"1F1F1F"].CGColor]];
        [_userView.layer insertSublayer:gradient above:0];
    }
    
    return _userView;
}

-(UIImageView *)userImgIcon{
    if (!_userImgIcon) {
        _userImgIcon=[[UIImageView alloc] initWithFrame:CGRectMake(8*SCREEN_RADIO, 4*SCREEN_RADIO, 42*SCREEN_RADIO, 42*SCREEN_RADIO)];
        _userImgIcon.layer.cornerRadius=21*SCREEN_RADIO;
        _userImgIcon.clipsToBounds=YES;
        _userImgIcon.image=[UIImage imageNamed:@"ab-avatar"];
    }
    
    return _userImgIcon;
}

-(UILabel *)userNickName{
    if (!_userNickName) {
        _userNickName=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.userImgIcon.frame)+17.5*SCREEN_RADIO, 7*SCREEN_RADIO, 0, 19*SCREEN_RADIO)];
        _userNickName.text=@"Walking works";
        _userNickName.textColor=[UIColor whiteColor];
        _userNickName.font=[UIFont boldSystemFontOfSize:16*SCREEN_RADIO];
        [_userNickName sizeToFit];
    }
    
    return _userNickName;
}

-(UILabel *)userContentLabel{
    if (!_userContentLabel) {
        _userContentLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.userImgIcon.frame)+17.5*SCREEN_RADIO, CGRectGetMaxY(self.userNickName.frame)+1, 0, 15*SCREEN_RADIO)];
        _userContentLabel.text=@"Walking works";
        _userContentLabel.textColor=[UIColor getColor:@"D1A8E6"];
        _userContentLabel.font=[UIFont boldSystemFontOfSize:12*SCREEN_RADIO];
        [_userContentLabel sizeToFit];
    }
    
    return _userContentLabel;
}

-(UIImageView *)userPersonImgView{
    if (!_userPersonImgView) {
        _userPersonImgView=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-81*SCREEN_RADIO, 25*SCREEN_RADIO-7.5*SCREEN_RADIO, 11*SCREEN_RADIO, 15*SCREEN_RADIO)];
        _userPersonImgView.image=[UIImage imageNamed:@"found_usericon"];
    }
    
    return _userPersonImgView;
}

-(UILabel *)userPersonLabel{
    if (!_userPersonLabel) {
        _userPersonLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.userPersonImgView.frame)+5.3*SCREEN_RADIO, 25*SCREEN_RADIO-11.5*SCREEN_RADIO, 0, 23*SCREEN_RADIO)];
        _userPersonLabel.text=@"1,234";
        _userPersonLabel.textColor=[UIColor getColor:@"ffffff"];
        _userPersonLabel.font=[UIFont boldSystemFontOfSize:18*SCREEN_RADIO];
        [_userPersonLabel sizeToFit];
    }
    
    return _userPersonLabel;
}
@end
