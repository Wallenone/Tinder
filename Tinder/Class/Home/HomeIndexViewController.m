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
#import "CHCardView.h"
#import "CHCardItemCustomView.h"
#import "CHCardItemModel.h"
@interface HomeIndexViewController ()<CHCardViewDelegate, CHCardViewDataSource>
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)RkyExtendedHitButton *rightBtn;
@property(nonatomic,strong)ProfileIndexView *profileVC;
@property(nonatomic,strong)LeftMenuViewDemo *leftDemo;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CHCardView *cardView;
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
    // data
    [self loadData];
    // reload
    [self.cardView reloadData];
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
    [self.view addSubview:self.tool1];
    [self.view addSubview:self.tool2];
    [self.view addSubview:self.tool3];
    [self.view addSubview:self.tool4];
    [self.view addSubview:self.tool5];
    [self.view addSubview:self.cardView];
}

- (void)loadData {
    
    // 随机切换..
    NSInteger random = arc4random_uniform(1000);
    if (random % 2 == 0) {
        //  本地数据
        [self.dataArray removeAllObjects];
        for (int i = 0; i < 10; i++) {
            CHCardItemModel *itemModel = [[CHCardItemModel alloc] init];
            itemModel.localImagename = [NSString stringWithFormat:@"%d.jpg", i + 1];
            [self.dataArray addObject:itemModel];
        }
    } else {
        
        // 网络数据
        [self.dataArray removeAllObjects];
        
        NSArray *urls = @[
                          @"http://photo.enterdesk.com/2010-10-24/enterdesk.com-3B11711A460036C51C19F87E7064FE9D.jpg",
                          @"http://img3.redocn.com/tupian/20150411/shouhuixiantiaopingguoshiliang_4042458.jpg",
                          @"http://pic28.nipic.com/20130424/11588775_115415688157_2.jpg",
                          @"http://www.274745.cc/imgall/obuwgnjonzuxa2ldfzrw63i/20100121/1396946_104643942888_2.jpg",
                          @"http://bizhi.zhuoku.com/2011/01/09/jingxuan/Jingxuan263.jpg",
                          @"http://img.taopic.com/uploads/allimg/131113/235002-13111309532260.jpg",
                          @"http://pic54.nipic.com/file/20141204/19902974_135858226000_2.jpg"
                          ];
        
        for (NSString *url in urls) {
            CHCardItemModel *itemModel = [[CHCardItemModel alloc] init];
            itemModel.imagename = url;
            [self.dataArray addObject:itemModel];
        }
    }
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
    [self loadData];
    [self.cardView reloadData];
}

-(void)toolClick2{
    [self.cardView deleteTheTopItemViewWithLeft:YES];
}

-(void)toolClick3{
    [self.cardView superLikeItem];
}

-(void)toolClick4{
    [self.cardView deleteTheTopItemViewWithLeft:NO];
}

-(void)toolClick5{
    
}

- (void)cardView:(CHCardView *)cardView didClickItemAtIndex:(NSInteger)index {
    
}

#pragma mark - CHCardViewDelegate
- (NSInteger)numberOfItemViewsInCardView:(CHCardView *)cardView {
    return self.dataArray.count;
}

- (CHCardItemView *)cardView:(CHCardView *)cardView itemViewAtIndex:(NSInteger)index {
    CHCardItemCustomView *itemView = [[CHCardItemCustomView alloc] initWithFrame:cardView.bounds];
    itemView.itemModel = self.dataArray[index];
    return itemView;
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

-(UIButton *)tool1{
    if (!_tool1) {
        _tool1=[[UIButton alloc] initWithFrame:CGRectMake(24*SCREEN_RADIO, SCREEN_HEIGHT-71*SCREEN_RADIO+19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool1 setImage:[UIImage imageNamed:@"tools_Rewind"] forState:UIControlStateNormal];
        [_tool1 addTarget:self action:@selector(toolClick1) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool1;
}

-(UIButton *)tool2{
    if (!_tool2) {
        _tool2=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool1.frame)+20*SCREEN_RADIO, SCREEN_HEIGHT-71*SCREEN_RADIO+14*SCREEN_RADIO, 54*SCREEN_RADIO, 54*SCREEN_RADIO)];
        [_tool2 setImage:[UIImage imageNamed:@"tools_Nope"] forState:UIControlStateNormal];
        [_tool2 addTarget:self action:@selector(toolClick2) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool2;
}

-(UIButton *)tool3{
    if (!_tool3) {
        _tool3=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool2.frame)+20*SCREEN_RADIO, SCREEN_HEIGHT-71*SCREEN_RADIO+ 19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool3 setImage:[UIImage imageNamed:@"tools_SuperLike"] forState:UIControlStateNormal];
        [_tool3 addTarget:self action:@selector(toolClick3) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool3;
}

-(UIButton *)tool4{
    if (!_tool4) {
        _tool4=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool3.frame)+20*SCREEN_RADIO, SCREEN_HEIGHT-71*SCREEN_RADIO+14*SCREEN_RADIO, 54*SCREEN_RADIO, 54*SCREEN_RADIO)];
        [_tool4 setImage:[UIImage imageNamed:@"tools_Like"] forState:UIControlStateNormal];
        [_tool4 addTarget:self action:@selector(toolClick4) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tool4;
}

-(UIButton *)tool5{
    if (!_tool5) {
        _tool5=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.tool4.frame)+20*SCREEN_RADIO, SCREEN_HEIGHT-71*SCREEN_RADIO+19*SCREEN_RADIO, 44*SCREEN_RADIO, 44*SCREEN_RADIO)];
        [_tool5 setImage:[UIImage imageNamed:@"tools_Boost"] forState:UIControlStateNormal];
        [_tool5 addTarget:self action:@selector(toolClick5) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _tool5;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (CHCardView *)cardView {
    if (!_cardView) {
        CHCardView *cardView = [[CHCardView alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.titleLabel.frame)+23*SCREEN_RADIO, SCREEN_WIDTH-20*SCREEN_RADIO, SCREEN_HEIGHT-160*SCREEN_RADIO)];
        _cardView = cardView;
        cardView.delegate = self;
        cardView.dataSource = self;
    }
    return _cardView;
}
@end
