//
//  HomeIndexViewController.m
//  Tinder
//
//  Created by wallen on 2018/1/10.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "HomeIndexViewController.h"
#import "ProfileIndexView.h"
#import "LeftMenuViewDemo.h"
@interface HomeIndexViewController ()
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)RkyExtendedHitButton *rightBtn;
@property(nonatomic,strong)ProfileIndexView *profileVC;
@property(nonatomic,strong)LeftMenuViewDemo *leftDemo;
@property(nonatomic,strong)UIImageView *contentImgView;
@property(nonatomic,strong)UIButton *tool1;
@property(nonatomic,strong)UIButton *tool2;
@property(nonatomic,strong)UIButton *tool3;
@property(nonatomic,strong)UIButton *tool4;
@property(nonatomic,strong)UIButton *tool5;
@end

@implementation HomeIndexViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor getColor:@"3D457F"];
    [self addNavView];
    [self addSubViews];
}

-(void)addNavView{
    ProfileIndexView *menu = [ProfileIndexView MenuViewWithDependencyView:self.view MenuView:self.leftDemo isShowCoverView:YES];
    self.profileVC = menu;
    
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.headerView addSubview:self.rightBtn];
}

-(void)addSubViews{
    [self.view addSubview:self.contentImgView];
    [self.view addSubview:self.tool1];
    [self.view addSubview:self.tool2];
    [self.view addSubview:self.tool3];
    [self.view addSubview:self.tool4];
    [self.view addSubview:self.tool5];
}

-(void)leftBlack{
    [self.profileVC show];
    
}

-(void)rightClick{
    
}

-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.profileVC hidenWithAnimation];
}

-(void)toolClick1{
    
}

-(void)toolClick2{
    
}

-(void)toolClick3{
    
}

-(void)toolClick4{
    
}

-(void)toolClick5{
    
}
-(UIView *)headerView{
    if (!_headerView) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _headerView.backgroundColor=[UIColor clearColor];
    }
    
    return _headerView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 35*SCREEN_RADIO, SCREEN_WIDTH, 21*SCREEN_RADIO)];
        _titleLabel.text=@"Index";
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

-(RkyExtendedHitButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn=[[RkyExtendedHitButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-42*SCREEN_RADIO, 35*SCREEN_RADIO, 22*SCREEN_RADIO, 21*SCREEN_RADIO)];
        [_rightBtn setImage:[UIImage imageNamed:@"ico-plus"] forState:UIControlStateNormal];
        _rightBtn.hitTestEdgeInsets=UIEdgeInsetsMake(-25,-25,-25,-25);
        [_rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightBtn;
}

-(LeftMenuViewDemo *)leftDemo{
    if (!_leftDemo) {
        _leftDemo = [[LeftMenuViewDemo alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];
    }
    
    return _leftDemo;
}

-(UIImageView *)contentImgView{
    if (!_contentImgView) {
        _contentImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20*SCREEN_RADIO, CGRectGetMaxY(self.titleLabel.frame)+23*SCREEN_RADIO, SCREEN_WIDTH-40*SCREEN_RADIO, SCREEN_HEIGHT-160*SCREEN_RADIO)];
        _contentImgView.backgroundColor=[UIColor whiteColor];
        _contentImgView.image=[UIImage imageNamed:@""];
        _contentImgView.layer.cornerRadius=8;
        _contentImgView.clipsToBounds=YES;
    }
    
    return _contentImgView;
}

-(UIButton *)tool1{
    if (!_tool1) {
        _tool1=[[UIButton alloc] initWithFrame:CGRectMake(24*SCREEN_RADIO, CGRectGetMaxY(self.contentImgView.frame)+19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool1 setImage:[UIImage imageNamed:@"tools_Rewind"] forState:UIControlStateNormal];
        [_tool1 addTarget:self action:@selector(toolClick1) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool1;
}

-(UIButton *)tool2{
    if (!_tool2) {
        _tool2=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool1.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.contentImgView.frame)+14*SCREEN_RADIO, 54*SCREEN_RADIO, 54*SCREEN_RADIO)];
        [_tool2 setImage:[UIImage imageNamed:@"tools_Nope"] forState:UIControlStateNormal];
        [_tool2 addTarget:self action:@selector(toolClick2) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool2;
}

-(UIButton *)tool3{
    if (!_tool3) {
        _tool3=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool2.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.contentImgView.frame)+19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool3 setImage:[UIImage imageNamed:@"tools_Boost"] forState:UIControlStateNormal];
        [_tool3 addTarget:self action:@selector(toolClick3) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool3;
}

-(UIButton *)tool4{
    if (!_tool4) {
        _tool4=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool3.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.contentImgView.frame)+14*SCREEN_RADIO, 54*SCREEN_RADIO, 54*SCREEN_RADIO)];
        [_tool4 setImage:[UIImage imageNamed:@"tools_Like"] forState:UIControlStateNormal];
        [_tool4 addTarget:self action:@selector(toolClick4) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool4;
}

-(UIButton *)tool5{
    if (!_tool5) {
        _tool5=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool4.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.contentImgView.frame)+ 19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool5 setImage:[UIImage imageNamed:@"tools_SuperLike"] forState:UIControlStateNormal];
        [_tool5 addTarget:self action:@selector(toolClick5) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool5;
}
@end
