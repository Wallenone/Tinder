//
//  UIMessageIndexViewController.m
//  Tinder
//
//  Created by wallen on 2018/2/9.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UIMessageIndexViewController.h"

@interface UIMessageIndexViewController ()
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)UILabel *newlabel;
@property(nonatomic,strong)UIButton *likeBtn;
@property(nonatomic,strong)UILabel *likeTitle;
@property(nonatomic,strong)UIButton *unLikeBtn;
@property(nonatomic,strong)UILabel *unLikeTitle;
@property(nonatomic,strong)UIButton *tinderBtn;
@property(nonatomic,strong)UILabel *tinerTitle;
@property(nonatomic,strong)UILabel *contentLable;
@property(nonatomic,strong)UILabel *contentLabel1;
@end

@implementation UIMessageIndexViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    [self addSubViews];
}

-(void)addSubViews{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.view addSubview:self.newlabel];
    [self.view addSubview:self.likeBtn];
    [self.view addSubview:self.likeTitle];
    [self.view addSubview:self.unLikeBtn];
    [self.view addSubview:self.unLikeTitle];
    [self.view addSubview:self.tinderBtn];
    [self.view addSubview:self.tinerTitle];
    [self.view addSubview:self.contentLable];
    [self.view addSubview:self.contentLabel1];
}


-(void)leftBlack{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)likeClick{
    
}

-(void)unlikeClick{
    
}

-(void)tinderClick{
    
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        CAGradientLayer *gradient = [CGCommonString setChangColorWithView:_headerView andColorStart:[UIColor getColor:@"E87975"] andEndColor:[UIColor getColor:@"F3C7A1"]];
        [_headerView.layer insertSublayer:gradient above:0];
    }
    
    return _headerView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 33*SCREEN_RADIO, SCREEN_WIDTH, 20*SCREEN_RADIO)];
        _titleLabel.text=@"Message";
        _titleLabel.font=[UIFont boldSystemFontOfSize:16*SCREEN_RADIO];
        _titleLabel.textColor=[UIColor getColor:@"ffffff"];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

-(RkyExtendedHitButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn=[[RkyExtendedHitButton alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 33*SCREEN_RADIO, 15*SCREEN_RADIO, 19*SCREEN_RADIO)];
        [_leftBtn setImage:[UIImage imageNamed:@"TinderHot"] forState:UIControlStateNormal];
        _leftBtn.hitTestEdgeInsets=UIEdgeInsetsMake(-25,-25,-25,-25);
        [_leftBtn addTarget:self action:@selector(leftBlack) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftBtn;
}

-(UILabel *)newlabel{
    if (!_newlabel) {
        _newlabel=[[UILabel alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, 74, 0, 13*SCREEN_RADIO)];
        _newlabel.textColor=[UIColor getColor:@"fd5068"];
        _newlabel.text=@"新的匹配";
        _newlabel.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_newlabel sizeToFit];
    }
    
    return _newlabel;
}

-(UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn=[[UIButton alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.newlabel.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 50*SCREEN_RADIO)];
        _likeBtn.backgroundColor=[UIColor grayColor];
        [_likeBtn addTarget:self action:@selector(likeClick) forControlEvents:UIControlEventTouchUpInside];
        _likeBtn.layer.cornerRadius=25*SCREEN_RADIO;
    }
    
    return _likeBtn;
}

-(UILabel *)likeTitle{
    if (!_likeTitle) {
        _likeTitle=[[UILabel alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.likeBtn.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 13*SCREEN_RADIO)];
        _likeTitle.text=@"赞";
        _likeTitle.textColor=[UIColor getColor:@"424242"];
        _likeTitle.textAlignment=NSTextAlignmentCenter;
        _likeTitle.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
    }
    
    return _likeTitle;
}

-(UIButton *)unLikeBtn{
    if (!_unLikeBtn) {
        _unLikeBtn=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.likeBtn.frame)+10*SCREEN_RADIO, CGRectGetMaxY(self.newlabel.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 50*SCREEN_RADIO)];
        _unLikeBtn.backgroundColor=[UIColor grayColor];
        [_unLikeBtn addTarget:self action:@selector(unlikeClick) forControlEvents:UIControlEventTouchUpInside];
        _unLikeBtn.layer.cornerRadius=25*SCREEN_RADIO;
    }
    
    return _unLikeBtn;
}

-(UILabel *)unLikeTitle{
    if (!_unLikeTitle) {
        _unLikeTitle=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.likeBtn.frame)+10*SCREEN_RADIO, CGRectGetMaxY(self.unLikeBtn.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 13*SCREEN_RADIO)];
        _unLikeTitle.text=@"不喜欢";
        _unLikeTitle.textColor=[UIColor getColor:@"424242"];
        _unLikeTitle.textAlignment=NSTextAlignmentCenter;
        _unLikeTitle.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        
    }
    
    return _unLikeTitle;
}


-(UIButton *)tinderBtn{
    if (!_tinderBtn) {
        _tinderBtn=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.unLikeBtn.frame)+10*SCREEN_RADIO, CGRectGetMaxY(self.newlabel.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 50*SCREEN_RADIO)];
        _tinderBtn.backgroundColor=[UIColor grayColor];
        [_tinderBtn addTarget:self action:@selector(tinderClick) forControlEvents:UIControlEventTouchUpInside];
        _tinderBtn.layer.cornerRadius=25*SCREEN_RADIO;
    }
    
    return _tinderBtn;
}

-(UILabel *)tinerTitle{
    if (!_tinerTitle) {
        _tinerTitle=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.unLikeBtn.frame)+10*SCREEN_RADIO, CGRectGetMaxY(self.tinderBtn.frame)+10*SCREEN_RADIO, 50*SCREEN_RADIO, 13*SCREEN_RADIO)];
        _tinerTitle.text=@"Tinder";
        _tinerTitle.textColor=[UIColor getColor:@"424242"];
        _tinerTitle.textAlignment=NSTextAlignmentCenter;
        _tinerTitle.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
    }
    
    return _tinerTitle;
}

-(UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable=[[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80*SCREEN_RADIO, SCREEN_WIDTH, 15*SCREEN_RADIO)];
        _contentLable.text=@"打招呼";
        _contentLable.textColor=[UIColor getColor:@"424242"];
        _contentLable.textAlignment=NSTextAlignmentCenter;
        _contentLable.font=[UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
    }
    
    return _contentLable;
}


-(UILabel *)contentLabel1{
    if (!_contentLabel1) {
        _contentLabel1=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentLable.frame)+20*SCREEN_RADIO, SCREEN_WIDTH, 13*SCREEN_RADIO)];
        _contentLabel1.text=@"点击上方的一个新匹配好友以发送消息";
        _contentLabel1.textColor=[UIColor getColor:@"999999"];
        _contentLabel1.textAlignment=NSTextAlignmentCenter;
        _contentLabel1.font=[UIFont systemFontOfSize:13*SCREEN_RADIO];
    }
    
    return _contentLabel1;
}
@end
