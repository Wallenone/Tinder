//
//  UILikeFriendsViewController.m
//  Tinder
//
//  Created by wallen on 2018/2/9.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UINoLikeFriendsViewController.h"

@interface UINoLikeFriendsViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)UIScrollView *contentScollView;
@property(nonatomic,strong)UILabel *maxLabel;
@end

@implementation UINoLikeFriendsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor getColor:@"2B415B"];
    [super viewDidLoad];
    [self addSubViews];
    [self setData];
}

-(void)addSubViews{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.view addSubview:self.contentScollView];
    [self.view addSubview:self.maxLabel];
}

-(void)setData{
    for (int i=0; i<10; i++) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH+38*SCREEN_RADIO, 0, SCREEN_WIDTH-76*SCREEN_RADIO, SCREEN_HEIGHT-174*SCREEN_RADIO)];
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-76*SCREEN_RADIO, SCREEN_HEIGHT-174*SCREEN_RADIO)];
        imgView.image=[UIImage imageNamed:@"4"];
        imgView.layer.cornerRadius=5;
        imgView.clipsToBounds=YES;
        [view addSubview:imgView];
        [self.contentScollView addSubview:view];
        
    }
    
    [self.contentScollView setContentSize:CGSizeMake(SCREEN_WIDTH*10, SCREEN_HEIGHT-174*SCREEN_RADIO)];
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _headerView.backgroundColor=[UIColor clearColor];
    }
    
    return _headerView;
}

-(void)leftBlack{
    [[TinerCommonControl sharedManager] showProfile];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    self.maxLabel.text=[NSString stringWithFormat:@"%d/%d",pageNo+1,10];
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 35*SCREEN_RADIO, SCREEN_WIDTH, 21*SCREEN_RADIO)];
        _titleLabel.text=@"NoLike Friends";
        _titleLabel.font=[UIFont systemFontOfSize:20*SCREEN_RADIO];
        _titleLabel.textColor=[UIColor getColor:@"ffffff"];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

-(RkyExtendedHitButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn=[[RkyExtendedHitButton alloc] initWithFrame:CGRectMake(20*SCREEN_RADIO, 37*SCREEN_RADIO, 22*SCREEN_RADIO, 17*SCREEN_RADIO)];
        [_leftBtn setImage:[UIImage imageNamed:@"ico-sidebar"] forState:UIControlStateNormal];
        _leftBtn.hitTestEdgeInsets=UIEdgeInsetsMake(-25,-25,-25,-25);
        [_leftBtn addTarget:self action:@selector(leftBlack) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftBtn;
}

-(UIScrollView *)contentScollView{
    if (!_contentScollView) {
        _contentScollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 87*SCREEN_RADIO, SCREEN_WIDTH, SCREEN_HEIGHT-174*SCREEN_RADIO)];
        _contentScollView.backgroundColor=[UIColor clearColor];
        _contentScollView.delegate=self;
        _contentScollView.showsHorizontalScrollIndicator=NO;
        _contentScollView.showsVerticalScrollIndicator=NO;
        _contentScollView.pagingEnabled=YES;
    }
    
    return _contentScollView;
}

-(UILabel *)maxLabel{
    if (!_maxLabel) {
        _maxLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentScollView.frame)+22*SCREEN_RADIO, SCREEN_WIDTH, 13*SCREEN_RADIO)];
        _maxLabel.text=@"1/10";
        _maxLabel.textColor=[UIColor getColor:@"CBD5DD"];
        _maxLabel.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        _maxLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _maxLabel;
}

@end
