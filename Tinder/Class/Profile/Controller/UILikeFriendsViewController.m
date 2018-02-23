//
//  UILikeFriendsViewController.m
//  Tinder
//
//  Created by wallen on 2018/2/9.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UILikeFriendsViewController.h"
#import "EZJFastTableView.h"
#import "UILikeFriendCell.h"
@interface UILikeFriendsViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)UIView *menuView;
@property(nonatomic,strong)EZJFastTableView *tbv;
@end

@implementation UILikeFriendsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor getColor:@"ECECEC"];
    [super viewDidLoad];
    [self addSubViews];
    [self setData];
}

-(void)addSubViews{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.tbv];
}

-(void)likeClick:(UIButton *)sender{
    UIView *likeLine=[self.view viewWithTag:110];
    UIView *loveLine=[self.view viewWithTag:111];
    likeLine.hidden=NO;
    loveLine.hidden=YES;
    
}

-(void)LoveClick:(UIButton *)sender{
    UIView *likeLine=[self.view viewWithTag:110];
    UIView *loveLine=[self.view viewWithTag:111];
    likeLine.hidden=YES;
    loveLine.hidden=NO;
}

-(void)setData{
 
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 122*SCREEN_RADIO)];
        CAGradientLayer *gradient = [CGCommonString setChangColorWithView:_headerView andColorArrs:@[(__bridge id)[UIColor getColor:@"1C93FB"].CGColor,(__bridge id)[UIColor getColor:@"735EE9"].CGColor,(__bridge id)[UIColor getColor:@"AC3DDF"].CGColor]];
        [_headerView.layer insertSublayer:gradient above:0];
        
        UIButton *likeBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 84*SCREEN_RADIO, SCREEN_WIDTH/2, 24*SCREEN_RADIO)];
        [likeBtn setTitle:@"Likes" forState:UIControlStateNormal];
        [likeBtn setTitleColor:[UIColor getColor:@"ffffff"] forState:UIControlStateNormal];
        [likeBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
        likeBtn.titleLabel.font=[UIFont systemFontOfSize:18*SCREEN_RADIO];
        [_headerView addSubview:likeBtn];
       
        CGFloat _width=[UILabel getWidthWithTitle:likeBtn.titleLabel.text font:likeBtn.titleLabel.font];
        
        UIView *likeLine=[[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4-_width/2, CGRectGetMaxY(likeBtn.frame)+10*SCREEN_RADIO, _width, 4)];
        likeLine.backgroundColor=[UIColor getColor:@"ffffff"];
        likeLine.tag=110;
        likeLine.hidden=NO;
        [_headerView addSubview:likeLine];
        
        
        UIButton *loveBtn=[[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 84*SCREEN_RADIO, SCREEN_WIDTH/2, 24*SCREEN_RADIO)];
        [loveBtn setTitle:@"Loves" forState:UIControlStateNormal];
        [loveBtn setTitleColor:[UIColor getColor:@"ffffff"] forState:UIControlStateNormal];
        [loveBtn addTarget:self action:@selector(LoveClick:) forControlEvents:UIControlEventTouchUpInside];
        loveBtn.titleLabel.font=[UIFont systemFontOfSize:18*SCREEN_RADIO];
        [_headerView addSubview:loveBtn];
        
        CGFloat _width1=[UILabel getWidthWithTitle:loveBtn.titleLabel.text font:loveBtn.titleLabel.font];
        
        UIView *loveLine=[[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+SCREEN_WIDTH/4-_width1/2, CGRectGetMaxY(loveBtn.frame)+10*SCREEN_RADIO, _width1, 4)];
        loveLine.backgroundColor=[UIColor getColor:@"ffffff"];
        loveLine.tag=111;
        loveLine.hidden=YES;
        [_headerView addSubview:loveLine];
        
    }
    
    return _headerView;
}

-(void)leftBlack{
    [[TinerCommonControl sharedManager] showProfile];
    
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 29*SCREEN_RADIO, SCREEN_WIDTH, 24*SCREEN_RADIO)];
        _titleLabel.text=@"Friends";
        _titleLabel.font=[UIFont systemFontOfSize:18*SCREEN_RADIO];
        _titleLabel.textColor=[UIColor getColor:@"ffffff"];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

-(RkyExtendedHitButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn=[[RkyExtendedHitButton alloc] initWithFrame:CGRectMake(20*SCREEN_RADIO, 34*SCREEN_RADIO, 19*SCREEN_RADIO, 17*SCREEN_RADIO)];
        [_leftBtn setImage:[UIImage imageNamed:@"hamburger_icon"] forState:UIControlStateNormal];
        _leftBtn.hitTestEdgeInsets=UIEdgeInsetsMake(-25,-25,-25,-25);
        [_leftBtn addTarget:self action:@selector(leftBlack) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftBtn;
}

-(EZJFastTableView *)tbv{
    if (!_tbv) {
        
        __weak typeof(self) weakSelf = self;
        CGRect tbvFrame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.headerView.frame));
        //初始化
        
        _tbv = [[EZJFastTableView alloc]initWithFrame:tbvFrame];
        _tbv.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tbv.backgroundColor=[UIColor getColor:@"ECECEC"];
        //给tableview赋值
        
        [_tbv setDataArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
        
        [_tbv onBuildCell:^(id cellData,NSString *cellIdentifier,NSIndexPath *index) {
            UILikeFriendCell *cell=[[UILikeFriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier withModel:@[]];
            
            return cell;
        }];
        
        //动态改变
        
        [_tbv onChangeCellHeight:^CGFloat(NSIndexPath *indexPath,id cellData) {
            
            return 175*SCREEN_RADIO;
        }];
        
        
        
      
        //设置选中事件 block设置方式
        //indexPath  是当前行对象 indexPath.row(获取行数)
        //cellData 是当前行的数据
        
        [_tbv onCellSelected:^(NSIndexPath *indexPath, id cellData) {
            NSLog(@"click");
            
        }];
        
        
        
    }
    
    return _tbv;
}
@end
