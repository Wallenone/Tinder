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
@property (nonatomic ,strong)LeftMenuViewDemo   *leftDemo;
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
}

-(void)addNavView{
    ProfileIndexView *menu = [ProfileIndexView MenuViewWithDependencyView:self.view MenuView:self.leftDemo isShowCoverView:YES];
    self.profileVC = menu;
    
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.headerView addSubview:self.rightBtn];
}

-(void)leftBlack{
    [self.profileVC show];
    
}

-(void)rightClick{
    
}

-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.profileVC hidenWithAnimation];
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
@end
