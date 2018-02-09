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
#import "SPCarouselView.h"
#import "CardScrollView.h"
#import "UIMessageIndexViewController.h"
@interface HomeIndexViewController ()<UIScrollViewDelegate,SPCarouselViewDelegate,CardScrollViewDelegate,CardScrollViewDataSource>{
    CGFloat _videoWidth;
    NSInteger _videoPageTotal;
    CGFloat _kCarouselViewH;
}
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *leftBtn;
@property(nonatomic,strong)RkyExtendedHitButton *rightBtn;
@property(nonatomic,strong)ProfileIndexView *profileVC;
@property(nonatomic,strong)LeftMenuViewDemo *leftDemo;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIButton *tool1;
@property(nonatomic,strong)UIButton *tool2;
@property(nonatomic,strong)UIButton *tool3;
@property(nonatomic,strong)UIButton *tool4;
@property(nonatomic,strong)UIButton *tool5;
@property(nonatomic,strong)UIScrollView *screenView;
@property(nonatomic,strong)SPCarouselView *screenImgView;
@property(nonatomic,strong)UIView *screenImgViewLine;
@property(nonatomic,strong)UIButton *screenCloseBtn;
@property(nonatomic,strong)UILabel *screenNickName;
@property(nonatomic,strong)UILabel *screenJuLi;  //距离
@property(nonatomic,strong)UIView *screenlineView;
@property(nonatomic,strong)UILabel *screenDescription;
@property(nonatomic,strong)UIView *screenLineView1;
@property(nonatomic,strong)UILabel *screenContentTitle;
@property(nonatomic,strong)UILabel *screenLabel;
@property(nonatomic,strong)UIScrollView *screenvideoScrollView;
@property(nonatomic,strong)CardScrollView *cardScrollView;
@property(nonatomic,strong)NSMutableArray *cards;
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
    
    _videoWidth=(SCREEN_WIDTH-50*SCREEN_RADIO)/3;
    _videoPageTotal=7;
    _kCarouselViewH=SCREEN_HEIGHT/5*3;
    self.view.backgroundColor=[UIColor getColor:@"3D457F"];
    [self addNavView];
    [self addSubViews];
    // data
    [self loadData];
    
    [self.cardScrollView loadCard];
}

-(void)addNavView{
    ProfileIndexView *menu = [ProfileIndexView MenuViewWithDependencyView:self.view MenuView:self.leftDemo isShowCoverView:YES];
    self.profileVC = menu;
    [TinerCommonControl sharedManager].profileVC=menu;
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBtn];
    [self.headerView addSubview:self.rightBtn];
}

-(void)addSubViews{
    [self.view addSubview:self.screenView];
    [self.view addSubview:self.cardScrollView];
    [self.screenView addSubview:self.screenImgView];
    [self.screenView addSubview:self.screenImgViewLine];
    [self.screenView addSubview:self.screenCloseBtn];
    [self.screenView addSubview:self.screenNickName];
    [self.screenView addSubview:self.screenJuLi];
    [self.screenView addSubview:self.screenlineView];
    [self.screenView addSubview:self.screenDescription];
    [self.screenView addSubview:self.screenLineView1];
    [self.screenView addSubview:self.screenContentTitle];
    [self.screenView addSubview:self.screenLabel];
    [self.screenView addSubview:self.screenvideoScrollView];
    [self.view addSubview:self.tool1];
    [self.view addSubview:self.tool2];
    [self.view addSubview:self.tool3];
    [self.view addSubview:self.tool4];
    [self.view addSubview:self.tool5];
    [self setToolsHidden:YES];
    [self setData];
}


-(void)setData{
    for (NSInteger i = 0; i < 20; i++) {
        [self.cards addObject:@(i)];
    }
    self.screenView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.screenvideoScrollView.frame)+100*SCREEN_RADIO);
    self.screenLabel.text=[NSString stringWithFormat:@"1/%ld",(long)_videoPageTotal];
    [self setVideoScrollData];
}


#pragma mark - CardScrollViewDelegate
- (void)updateCard:(UIView *)card withProgress:(CGFloat)progress direction:(CardMoveDirection)direction {
    if (direction == CardMoveDirectionNone) {
        if (card.tag != [self.cardScrollView currentCard]) {
            CGFloat scale = 1 - 0.1 * progress;
            card.layer.transform = CATransform3DMakeScale(scale, scale, 1.0);
            card.layer.opacity = 1 - 0.2*progress;
        } else {
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1;
        }
    } else {
        NSInteger transCardTag = direction == CardMoveDirectionLeft ? [self.cardScrollView currentCard] + 1 : [self.cardScrollView currentCard] - 1;
        if (card.tag != [self.cardScrollView currentCard] && card.tag == transCardTag) {
            card.layer.transform = CATransform3DMakeScale(0.9 + 0.1*progress, 0.9 + 0.1*progress, 1.0);
            card.layer.opacity = 0.8 + 0.2*progress;
        } else if (card.tag == [self.cardScrollView currentCard]) {
            card.layer.transform = CATransform3DMakeScale(1 - 0.1 * progress, 1 - 0.1 * progress, 1.0);
            card.layer.opacity = 1 - 0.2*progress;
        }
    }
}

#pragma mark - CardScrollViewDataSource
- (NSInteger)numberOfCards {
    return self.cards.count;
}

- (UIView *)cardReuseView:(UIView *)reuseView atIndex:(NSInteger)index {
    if (reuseView) {
        // you can set new style
        return reuseView;
    }
    
    UIView *card = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-38*2, self.view.frame.size.height-87*2)];
    card.layer.backgroundColor = [UIColor whiteColor].CGColor;
    card.layer.cornerRadius = 4;
    card.layer.masksToBounds = YES;
    
    return card;
}

- (void)deleteCardWithIndex:(NSInteger)index {
    [self.cards removeObjectAtIndex:index];
}

- (void)clickItem:(NSInteger)index{
    [self setScreenViewData:index];
}

-(void)setVideoScrollData{
    for (int i=0; i<_videoPageTotal; i++) {
        for (int j=0; j<6; j++) {
            // 计算位置
            int row = j/3;
            int column = j%3;
            CGFloat x = 15*SCREEN_RADIO + column * (_videoWidth + 10*SCREEN_RADIO);
            CGFloat y = 0 + row * (_videoWidth + 10*SCREEN_RADIO);
            
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(x+i*SCREEN_WIDTH, y, _videoWidth, _videoWidth)];
            btn.layer.cornerRadius=5;
            btn.layer.masksToBounds = YES;
            [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(singleTapAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.screenvideoScrollView addSubview:btn];
        }
    }
    [self.screenvideoScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*_videoPageTotal, _videoWidth*2+20*SCREEN_RADIO)];
    
}

-(void)singleTapAction:(UIButton *)sender
{
    
}

- (void)loadData {
    
}

-(void)leftBlack{
    [self.profileVC show];
    
}

-(void)rightClick{
    UIMessageIndexViewController *messageVC=[[UIMessageIndexViewController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.profileVC hidenWithAnimation];
}


-(void)toolClick1{
    [self loadData];
}

-(void)toolClick2{
   
}

-(void)toolClick3{
    
}

-(void)toolClick4{
    
}

-(void)toolClick5{
    
}

-(void)closeScreenClick{
    [self setToolsHidden:YES];
    self.screenView.hidden=YES;
    self.cardScrollView.hidden=NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

-(void)setScreenViewData:(NSInteger)index{
    self.cardScrollView.hidden=YES;
    self.screenView.hidden=NO;
    [self setToolsHidden:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [self.view setNeedsLayout];
}

-(void)setToolsHidden:(BOOL)state{
    if (state) {
        self.tool1.hidden=NO;
        self.tool2.hidden=NO;
        self.tool3.hidden=NO;
        self.tool4.hidden=NO;
        self.tool5.hidden=NO;
    }else{
        self.tool1.hidden=YES;
        self.tool2.hidden=NO;
        self.tool3.hidden=NO;
        self.tool4.hidden=NO;
        self.tool5.hidden=YES;
    }
}

#pragma mark - SPCarouselViewDelegate
- (void)carouselView:(SPCarouselView *)carouselView clickedImageAtIndex:(NSUInteger)index {
    NSLog(@"代理方式:点击了第%zd张图片",index);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (scrollView==self.screenView) {
        CGFloat width = self.view.frame.size.width;
        
        CGFloat offsetY = scrollView.contentOffset.y;
        
        // if (scrollView == self.tableView) {
        
        // 偏移的y值
        if(offsetY < 0) {
            CGFloat totalOffset = _kCarouselViewH + fabs(offsetY);
            CGFloat f = totalOffset / _kCarouselViewH;
            // 拉伸后的图片的frame应该是同比例缩放。
            self.screenImgView.frame = CGRectMake(-(width*f-width) / 2.0, offsetY, width * f, totalOffset);
        }
        //}
    }else if(scrollView==self.screenvideoScrollView){
        self.screenLabel.text=[NSString stringWithFormat:@"%d/%ld",page+1,(long)_videoPageTotal];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //self.screenImgView.autoScroll = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //self.screenImgView.autoScroll = YES;
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


-(UIScrollView *)screenView{
    if (!_screenView) {
        _screenView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _screenView.showsHorizontalScrollIndicator=NO;
        _screenView.showsVerticalScrollIndicator=NO;
        _screenView.hidden=YES;
        _screenView.backgroundColor=[UIColor whiteColor];
        _screenView.delegate=self;
        // 设置最大伸缩比例
        
        _screenView.maximumZoomScale = 2.0;
        
        // 设置最小伸缩比例
        
        _screenView.minimumZoomScale = 0.2;
    }
    
    return _screenView;
}


-(SPCarouselView *)screenImgView{
    if(!_screenImgView){
        _screenImgView = [[SPCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/5*3)];
        // 属性设置
        _screenImgView.delegate=self;
        _screenImgView.autoScroll = NO;
        _screenImgView.urlImages=@[@"http://n.sinaimg.cn/translate/w600h337/20180208/LdC4-fyrkuxs0818998.jpg"];
        _screenImgView.userInteractionEnabled=NO;
    }
    
    return _screenImgView;
}


-(UIView *)screenImgViewLine{
    if (!_screenImgViewLine) {
        _screenImgViewLine=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.screenImgView.frame), SCREEN_WIDTH, 1)];
        _screenImgViewLine.backgroundColor=[UIColor getColor:@"ECECEC"];
    }
    
    return _screenImgViewLine;
}

-(UIButton *)screenCloseBtn{
    if (!_screenCloseBtn) {
        _screenCloseBtn=[[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-55*SCREEN_RADIO, SCREEN_HEIGHT/5*3-18.5*SCREEN_RADIO, 40*SCREEN_RADIO, 40*SCREEN_RADIO)];
        [_screenCloseBtn setImage:[UIImage imageNamed:@"tools_Nope"] forState:UIControlStateNormal];
        [_screenCloseBtn addTarget:self action:@selector(closeScreenClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _screenCloseBtn;
}

-(UILabel *)screenNickName{
    if (!_screenNickName) {
        _screenNickName=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.screenImgView.frame)+15*SCREEN_RADIO, 0, 18*SCREEN_RADIO)];
        _screenNickName.text=@"Wallen, 30";
        _screenNickName.textColor=[UIColor getColor:@"000000"];
        _screenNickName.font=[UIFont systemFontOfSize:18*SCREEN_RADIO];
        [_screenNickName sizeToFit];
    }
    
    return _screenNickName;
}

-(UILabel *)screenJuLi{
    if (!_screenJuLi) {
        _screenJuLi=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.screenNickName.frame)+10*SCREEN_RADIO, 0, 14*SCREEN_RADIO)];
        _screenJuLi.text=@"10 公里以外";
        _screenJuLi.textColor=[UIColor getColor:@"7c7c7c"];
        _screenJuLi.font=[UIFont systemFontOfSize:14*SCREEN_RADIO];
        [_screenJuLi sizeToFit];
    }
    
    return _screenJuLi;
}

-(UIView *)screenlineView{
    if (!_screenlineView) {
        _screenlineView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.screenJuLi.frame)+15*SCREEN_RADIO, SCREEN_WIDTH, 1)];
        _screenlineView.backgroundColor=[UIColor getColor:@"ECECEC"];
    }
    
    return _screenlineView;
}

-(UILabel *)screenDescription{
    if (!_screenDescription) {
        _screenDescription = [[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.screenlineView.frame)+15*SCREEN_RADIO, SCREEN_WIDTH-30*SCREEN_RADIO, 0)];
        _screenDescription.text = @"这是labelOne的高度自适应这是labelOne的高度自适应这是labelOne的高度自适应这是labelOne的高度自适应是labelOne的高度自适应这是labelOne的高度自适应是labelOne的高度自适应这是labelOne的高度自适应是";
        
        _screenDescription.font = [UIFont systemFontOfSize:15*SCREEN_RADIO];
        _screenDescription.numberOfLines = 0;
        _screenDescription.textColor=[UIColor getColor:@"7c7c7c"];
        CGFloat height = [UILabel getHeightByWidth:_screenDescription.frame.size.width title:_screenDescription.text font:_screenDescription.font];
        
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        
        paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        
        paraStyle.alignment = NSTextAlignmentLeft;
        
        paraStyle.lineSpacing = 6;
        
        NSDictionary *dic = @{NSFontAttributeName:_screenDescription.font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0
                              };
        NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:_screenDescription.text attributes:dic];
        
        _screenDescription.attributedText = attributeStr;
        
        CGFloat labelHeight = [_screenDescription sizeThatFits:CGSizeMake(SCREEN_WIDTH-30*SCREEN_RADIO, MAXFLOAT)].height;
        NSNumber *count = @((labelHeight) / _screenDescription.font.lineHeight);
        
        _screenDescription.frame = CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.screenlineView.frame)+10*SCREEN_RADIO, SCREEN_WIDTH-30*SCREEN_RADIO, height+[count floatValue]*6);
    }
    
    return _screenDescription;
}

-(UIView *)screenLineView1{
    if (!_screenLineView1) {
        _screenLineView1=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.screenDescription.frame)+20*SCREEN_RADIO, SCREEN_WIDTH, 1)];
        _screenLineView1.backgroundColor=[UIColor getColor:@"ECECEC"];
    }
    
    return _screenLineView1;
}

-(UILabel *)screenContentTitle{
    if (!_screenContentTitle) {
        _screenContentTitle=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.screenLineView1.frame)+10*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        _screenContentTitle.text=@"1673 个 视频";
        _screenContentTitle.textColor=[UIColor getColor:@"000000"];
        _screenContentTitle.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [_screenContentTitle sizeToFit];
    }
    
    return _screenContentTitle;
}

-(UILabel *)screenLabel{
    if (!_screenLabel) {
        _screenLabel=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(self.screenLineView1.frame)+15*SCREEN_RADIO, SCREEN_WIDTH/2-15*SCREEN_RADIO, 10*SCREEN_RADIO)];
        _screenLabel.textColor=[UIColor getColor:@"000000"];
        _screenLabel.font=[UIFont systemFontOfSize:10*SCREEN_RADIO];
        _screenLabel.textAlignment=NSTextAlignmentRight;
    }
    
    return _screenLabel;
}

-(UIScrollView *)screenvideoScrollView{
    if (!_screenvideoScrollView) {
        _screenvideoScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.screenContentTitle.frame)+10*SCREEN_RADIO, SCREEN_WIDTH, _videoWidth*2+20*SCREEN_RADIO)];
        _screenvideoScrollView.backgroundColor=[UIColor clearColor];
        _screenvideoScrollView.pagingEnabled = YES; //使用翻页属性
        _screenvideoScrollView.delegate = self;//这个是重点
        _screenvideoScrollView.showsHorizontalScrollIndicator=NO;
        _screenvideoScrollView.showsVerticalScrollIndicator=NO;
    }
    
    return _screenvideoScrollView;
}

-(CardScrollView *)cardScrollView{
    if (!_cardScrollView) {
        _cardScrollView=[[CardScrollView alloc] initWithFrame:CGRectMake(0, 87*SCREEN_RADIO, SCREEN_WIDTH, SCREEN_HEIGHT-174*SCREEN_RADIO)];
        _cardScrollView.cardDelegate = self;
        _cardScrollView.cardDataSource = self;
    }
    
    return _cardScrollView;
}

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards=[NSMutableArray array];
    }
    
    return _cards;
}
@end
