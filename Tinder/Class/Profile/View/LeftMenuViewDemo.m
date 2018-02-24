//
//  LeftMenuViewDemo.m
//  MenuDemo
//
//  Created by Lying on 16/6/12.
//  Copyright © 2016年 Lying. All rights reserved.
//
#define ImageviewWidth    18
#define Frame_Width       self.frame.size.width//200

#import "LeftMenuViewDemo.h"
#import "EZJFastTableView.h"
#import "LeftMenuCell.h"
#import "UIProfileHomeViewController.h"
#import "UISettingViewController.h"
#import "UILikeFriendsViewController.h"
#import "UIFoundViewController.h"
@interface LeftMenuViewDemo ()<UIScrollViewDelegate>{
    NSInteger _currentTag;
}
@property(nonatomic,strong)UIImageView *diImgView;
@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nickNameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *pitImgView;
@property(nonatomic,strong)UIButton *profileBtn;
@property(nonatomic,strong)EZJFastTableView *tbv;
@property(nonatomic,strong)UIScrollView *tinderBuyScrollView;
@property(nonatomic,strong)UIPageControl *tinderBuyControl;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSTimer *aotuScrollTimer;
@end

@implementation LeftMenuViewDemo

 
-(instancetype)initWithFrame:(CGRect)frame{

    if(self = [super initWithFrame:frame]){
        CAGradientLayer *gradient = [CGCommonString setChangColorWithView:self andColorArrs:@[(__bridge id)[UIColor getColor:@"1C93FB"].CGColor,(__bridge id)[UIColor getColor:@"735EE9"].CGColor,(__bridge id)[UIColor getColor:@"AC3DDF"].CGColor]];
        [self.layer insertSublayer:gradient above:0];
        [self addSubViews];
        [self setData];
    }
    return  self;
}

-(void)addSubViews{
   // [self addSubview:self.diImgView];
    [self addSubview:self.iconImgView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.pitImgView];
    [self addSubview:self.profileBtn];
    [self addSubview:self.tbv];
    [self addSubview:self.tinderBuyScrollView];
    [self addSubview:self.tinderBuyControl];
    [self addSubview:self.footerView];
    
}

-(void)setData{
    [self.tbv selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    for (int i=0; i<7; i++) {
        
        
        UILabel *labelTitle=[[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 5*SCREEN_RADIO, self.frame.size.width, 18*SCREEN_RADIO)];
        labelTitle.text=@"管理您的个人资料";
        labelTitle.textColor=[UIColor whiteColor];
        labelTitle.font=[UIFont boldSystemFontOfSize:18*SCREEN_RADIO];
        labelTitle.textAlignment=NSTextAlignmentCenter;
        
        CGSize size = [labelTitle.text sizeWithFont:labelTitle.font constrainedToSize:CGSizeMake(self.frame.size.width, 15*SCREEN_RADIO)];
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width+(self.frame.size.width/2-size.width/2-27*SCREEN_RADIO), 5*SCREEN_RADIO, 22*SCREEN_RADIO, 22*SCREEN_RADIO)];
        img.image=[UIImage imageNamed:@"tools_SuperLike"];
        
        
        UILabel *content=[[UILabel alloc] initWithFrame:CGRectMake(i*self.frame.size.width,CGRectGetMaxY(labelTitle.frame)+6*SCREEN_RADIO, self.frame.size.width, 12*SCREEN_RADIO)];
        content.text=@"使用Tinder Plus 来限制他人可见的内容";
        content.textColor=[UIColor whiteColor];
        content.font=[UIFont systemFontOfSize:12*SCREEN_RADIO];
        content.textAlignment=NSTextAlignmentCenter;
        
        [self.tinderBuyScrollView addSubview:labelTitle];
        [self.tinderBuyScrollView addSubview:img];
        [self.tinderBuyScrollView addSubview:content];
    }
    
    [self.tinderBuyScrollView setContentSize:CGSizeMake(self.frame.size.width*7, 80*SCREEN_RADIO)];

}


-(void)aotuScrollToNext:(NSTimer*)timer{
    self.tinderBuyControl.currentPage+=1;
    
    if (self.tinderBuyControl.currentPage>=7) {
        self.tinderBuyControl.currentPage=0;
    }
}

-(void)profileClick{
    [[TinerCommonControl sharedManager] hideProfile];
    UIProfileHomeViewController *profileVC=[[UIProfileHomeViewController alloc] init];
    [[CGCommonToolsNode getCurrentVC].navigationController pushViewController:profileVC animated:YES];
}

-(void)settingClick{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    self.tinderBuyControl.currentPage=pageNo;
    
}

- (void) scrollViewWillBeginDragging: (UIScrollView*) scrollview{
    //当用户准备拖曳时停止定时器,以后重启需重新启动,不会自动启动
    [self.aotuScrollTimer invalidate];
}


-(UIImageView *)diImgView{
    if (!_diImgView) {
        _diImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 219*SCREEN_RADIO, 293*SCREEN_RADIO, 209*SCREEN_RADIO)];
        _diImgView.image=[UIImage imageNamed:@"pattern"];
    }
    
    return _diImgView;
}

-(UIImageView *)iconImgView{
    if (!_iconImgView) {
        _iconImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20*SCREEN_RADIO, 50*SCREEN_RADIO, 55*SCREEN_RADIO, 55*SCREEN_RADIO)];
        _iconImgView.image=[UIImage imageNamed:@"bc-avatar"];
        _iconImgView.layer.cornerRadius=55/2*SCREEN_RADIO;
        _iconImgView.clipsToBounds=YES;
    }
    
    return _iconImgView;
}

-(UILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImgView.frame)+ 24*SCREEN_RADIO, 54*SCREEN_RADIO, 0, 16*SCREEN_RADIO)];
        _nickNameLabel.text=@"William Griffin";
        _nickNameLabel.textColor=[UIColor whiteColor];
        _nickNameLabel.font=[UIFont boldSystemFontOfSize:16*SCREEN_RADIO];
        [_nickNameLabel sizeToFit];
    }
    
    return _nickNameLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImgView.frame)+23*SCREEN_RADIO, CGRectGetMaxY(self.nickNameLabel.frame)+8*SCREEN_RADIO, 0, 18*SCREEN_RADIO)];
        _contentLabel.text=@"will@evrybo.com";
        _contentLabel.textColor=[UIColor getColor:@"BDCADB"];
        _contentLabel.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [_contentLabel sizeToFit];
    }
    
    return _contentLabel;
}

-(UIImageView *)pitImgView{
    if (!_pitImgView) {
        _pitImgView=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-50*SCREEN_RADIO, 67*SCREEN_RADIO, 22*SCREEN_RADIO, 22*SCREEN_RADIO)];
        _pitImgView.image=[UIImage imageNamed:@"ico-dots"];
    }
    
    return _pitImgView;
}

-(UIButton *)profileBtn{
    if(!_profileBtn){
        _profileBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(self.contentLabel.frame)+56*SCREEN_RADIO)];
        [_profileBtn addTarget:self action:@selector(profileClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _profileBtn;
}

-(EZJFastTableView *)tbv{
    if (!_tbv) {
       
        CGRect tbvFrame = CGRectMake(22*SCREEN_RADIO, CGRectGetMaxY(self.contentLabel.frame)+56*SCREEN_RADIO, 245*SCREEN_RADIO, 345*SCREEN_RADIO);
        //初始化
        
        _tbv = [[EZJFastTableView alloc]initWithFrame:tbvFrame];
        _tbv.backgroundColor=[UIColor clearColor];
        _tbv.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tbv.scrollEnabled=NO;
        //给tableview赋值
        [_tbv setDataArray:@[@{@"icon":@"ico-Inbox",@"text":@"Tinder",@"width":@"21",@"height":@"23"},@{@"icon":@"ico-draft",@"text":@"Setting",@"width":@"21",@"height":@"20"},@{@"icon":@"ico-star",@"text":@"Friends",@"width":@"18",@"height":@"18"},@{@"icon":@"ico-sent",@"text":@"Found",@"width":@"23.9",@"height":@"21.1"}]];
        
        [_tbv onBuildCell:^(id cellData,NSString *cellIdentifier,NSIndexPath *index) {
            LeftMenuCell *cell=[[LeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier WithModel:cellData];
            
            return cell;
        }];
        
        //动态改变
        [_tbv onChangeCellHeight:^CGFloat(NSIndexPath *indexPath,id cellData) {
            return 54*SCREEN_RADIO;
        }];
        
       
        
        //设置选中事件 block设置方式
        //indexPath  是当前行对象 indexPath.row(获取行数)
        //cellData 是当前行的数据
        
        [_tbv onCellSelected:^(NSIndexPath *indexPath, id cellData) {
            [[TinerCommonControl sharedManager] hideProfile];
            if (indexPath.row==0) {
                [[CGCommonToolsNode getCurrentVC].navigationController popToRootViewControllerAnimated:YES];
            }else if (indexPath.row==1){
                UISettingViewController *settingVC=[[UISettingViewController alloc] init];
                [[CGCommonToolsNode getCurrentVC].navigationController pushViewController:settingVC animated:YES];
            }else if (indexPath.row==2){
                UILikeFriendsViewController *likeVC=[[UILikeFriendsViewController alloc] init];
                [[CGCommonToolsNode getCurrentVC].navigationController pushViewController:likeVC animated:YES];
            }else if (indexPath.row==3){
                UIFoundViewController *noLickVC=[[UIFoundViewController alloc] init];
                [[CGCommonToolsNode getCurrentVC].navigationController pushViewController:noLickVC animated:YES];
            }
        }];
    }
    
    return _tbv;
}

-(UIScrollView *)tinderBuyScrollView{
    if (!_tinderBuyScrollView) {
        _tinderBuyScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200*SCREEN_RADIO, self.frame.size.width, 80*SCREEN_RADIO)];
        //_tinderBuyScrollView.backgroundColor=[UIColor redColor];
        _tinderBuyScrollView.pagingEnabled=YES;
        _tinderBuyScrollView.showsVerticalScrollIndicator=NO;
        _tinderBuyScrollView.showsHorizontalScrollIndicator=NO;
        _tinderBuyScrollView.delegate=self;
    }
    
    return _tinderBuyScrollView;
}

-(UIPageControl *)tinderBuyControl{
    if (!_tinderBuyControl) {
        _tinderBuyControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150*SCREEN_RADIO, self.frame.size.width, 20*SCREEN_RADIO)];
        _tinderBuyControl.numberOfPages=7;
        _tinderBuyControl.currentPageIndicatorTintColor = [UIColor getColor:@"84f3f4"];
        _tinderBuyControl.pageIndicatorTintColor = [UIColor getColor:@"e5e8e8"];
        [_tinderBuyControl sizeForNumberOfPages:2];
    }
    
    return _tinderBuyControl;
}

-(UIView *)footerView{
    if (!_footerView) {
        _footerView=[[UIView alloc] initWithFrame:CGRectMake(30*SCREEN_RADIO, SCREEN_HEIGHT-83*SCREEN_RADIO, 245*SCREEN_RADIO, 45*SCREEN_RADIO)];
        
        UIImageView *icon=[[UIImageView alloc] initWithFrame:CGRectMake(19*SCREEN_RADIO, 11*SCREEN_RADIO, 20*SCREEN_RADIO, 21*SCREEN_RADIO)];
        icon.image=[UIImage imageNamed:@"ico-settings"];
        [_footerView addSubview:icon];
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(icon.frame)+31*SCREEN_RADIO, 15*SCREEN_RADIO, 0, 16*SCREEN_RADIO)];
        label.text=@"Settings";
        label.textColor=[UIColor getColor:@"ffffff"];
        label.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        [label sizeToFit];
        [_footerView addSubview:label];
        
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 245*SCREEN_RADIO, 45*SCREEN_RADIO)];
        [btn addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
    }
    
    return _footerView;
}


@end
