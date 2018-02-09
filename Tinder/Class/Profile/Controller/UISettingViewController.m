//
//  UISettingViewController.m
//  Tinder
//
//  Created by wallen on 2018/2/9.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UISettingViewController.h"

@interface UISettingViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *rightBtn;
@property(nonatomic,strong)UIView *goldView;
@property(nonatomic,strong)UIView *zanView;
@property(nonatomic,strong)UIView *boostView;
@property(nonatomic,strong)UIView *superLikeView;
@property(nonatomic,strong)UILabel *fonudLabel;
@property(nonatomic,strong)UIView *locationView;
@property(nonatomic,strong)UIView *maxLacationView;
@property(nonatomic,strong)UIView *sexView;
@property(nonatomic,strong)UIView *ageView;
@property(nonatomic,strong)UIButton *logoutBtn;
@property(nonatomic,strong)UIButton *deleteBtn;
@end

@implementation UISettingViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor getColor:@"F7f7F7"];
    [self addSubViews];
}

-(void)addSubViews{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.rightBtn];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.goldView];
    [self.scrollView addSubview:self.zanView];
    [self.scrollView addSubview:self.boostView];
    [self.scrollView addSubview:self.superLikeView];
    [self.scrollView addSubview:self.fonudLabel];
    [self.scrollView addSubview:self.locationView];
    [self.scrollView addSubview:self.maxLacationView];
    [self.scrollView addSubview:self.sexView];
    [self.scrollView addSubview:self.ageView];
    [self.scrollView addSubview:self.logoutBtn];
    [self.scrollView addSubview:self.deleteBtn];
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.deleteBtn.frame)+20*SCREEN_RADIO)];
}

- (void)saveClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)logoutClick{
    
}

-(void)deleteClick{
    
}

-(void)sliderLocationValueChanged:(UISlider *)slider{
    
}

-(void)sliderAgeValueChanged:(UISlider *)slider{
    
}

-(UIView *)headerView{
    if(!_headerView){
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _headerView.backgroundColor=[UIColor getColor:@"fdfdfd"];
    }
    
    return _headerView;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 33, SCREEN_WIDTH, 15*SCREEN_RADIO)];
        _titleLabel.font=[UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
        _titleLabel.text=@"设置";
        _titleLabel.textColor=[UIColor getColor:@"000000"];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

-(RkyExtendedHitButton *)rightBtn{
    if(!_rightBtn){
        NSString *_text=@"完成";
        _rightBtn=[[RkyExtendedHitButton alloc] init];
        _rightBtn.titleLabel.font=[UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
        [_rightBtn setTitle:_text forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor getColor:@"FD5068"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.hitTestEdgeInsets = UIEdgeInsetsMake(-25, -25, -25, -25);
        
        CGSize size = [_text sizeWithFont:[UIFont systemFontOfSize:15*SCREEN_RADIO] constrainedToSize:CGSizeMake(300, 15*SCREEN_RADIO)];
        
        _rightBtn.frame=CGRectMake(SCREEN_WIDTH-15*SCREEN_RADIO-size.width, 33*SCREEN_RADIO, size.width, 15*SCREEN_RADIO);
    }
    
    return _rightBtn;
}

-(UIScrollView *)scrollView{
    if(!_scrollView){
        _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _scrollView.backgroundColor=[UIColor clearColor];
    }
    
    return _scrollView;
}

-(UIView *)goldView{
    if (!_goldView) {
        _goldView=[[UIView alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, 10*SCREEN_RADIO, SCREEN_WIDTH-20*SCREEN_RADIO, 70*SCREEN_RADIO)];
        _goldView.backgroundColor=[UIColor getColor:@"ffffff"];
        _goldView.layer.cornerRadius=5;
    }
    
    return _goldView;
}

-(UIView *)zanView{
    if (!_zanView) {
        _zanView=[[UIView alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.goldView.frame)+ 10*SCREEN_RADIO, SCREEN_WIDTH-20*SCREEN_RADIO, 70*SCREEN_RADIO)];
        _zanView.backgroundColor=[UIColor getColor:@"ffffff"];
        _zanView.layer.cornerRadius=5;
    }
    
    return _zanView;
}

-(UIView *)boostView{
    if (!_boostView) {
        _boostView=[[UIView alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.zanView.frame)+ 10*SCREEN_RADIO, (SCREEN_WIDTH-20*SCREEN_RADIO)/2, 70*SCREEN_RADIO)];
        _boostView.backgroundColor=[UIColor getColor:@"ffffff"];
        _boostView.layer.cornerRadius=5;
    }
    
    return _boostView;
}

-(UIView *)superLikeView{
    if (!_superLikeView) {
        _superLikeView=[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.boostView.frame)+10*SCREEN_RADIO, CGRectGetMaxY(self.zanView.frame)+ 10*SCREEN_RADIO, (SCREEN_WIDTH-20*SCREEN_RADIO)/2, 70*SCREEN_RADIO)];
        _superLikeView.backgroundColor=[UIColor getColor:@"ffffff"];
        _superLikeView.layer.cornerRadius=5;
    }
    
    return _superLikeView;
}

-(UILabel *)fonudLabel{
    if (!_fonudLabel) {
        _fonudLabel=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.superLikeView.frame)+20*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _fonudLabel.text=@"发现设置";
        _fonudLabel.textColor=[UIColor getColor:@"898989"];
        _fonudLabel.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_fonudLabel sizeToFit];
    }
    
    return _fonudLabel;
}

-(UIView *)locationView{
    if (!_locationView) {
        _locationView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.fonudLabel.frame)+10*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _locationView.backgroundColor=[UIColor whiteColor];
        UILabel *locationName=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 10*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        locationName.text=@"位置";
        locationName.textColor=[UIColor getColor:@"000000"];
        locationName.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [locationName sizeToFit];
        [_locationView addSubview:locationName];
        
        UILabel *locationContent=[[UILabel alloc] initWithFrame:CGRectMake(0, 10*SCREEN_RADIO, SCREEN_WIDTH-30*SCREEN_RADIO, 15*SCREEN_RADIO)];
        locationContent.text=@"我的当前位置";
        locationContent.textColor=[UIColor getColor:@"666666"];
        locationContent.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        locationContent.textAlignment=NSTextAlignmentRight;
        [_locationView addSubview:locationContent];
        
        
        UIImageView *allow=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(locationContent.frame)+5*SCREEN_RADIO, 25*SCREEN_RADIO-5.5*SCREEN_RADIO, 6*SCREEN_RADIO, 11*SCREEN_RADIO)];
        allow.image=[UIImage imageNamed:@"myAllowLeft"];
        [_locationView addSubview:allow];
        
        UILabel *locationContentallow=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(locationContent.frame)+3*SCREEN_RADIO, SCREEN_WIDTH-30*SCREEN_RADIO, 13*SCREEN_RADIO)];
        locationContentallow.text=@"正在载入...";
        locationContentallow.textColor=[UIColor getColor:@"666666"];
        locationContentallow.font=[UIFont systemFontOfSize:13*SCREEN_RADIO];
        locationContentallow.textAlignment=NSTextAlignmentRight;
        [_locationView addSubview:locationContentallow];
        
        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 50*SCREEN_RADIO-0.5, SCREEN_WIDTH-15*SCREEN_RADIO, 0.5)];
        lineView.backgroundColor=[UIColor getColor:@"C8c7cc"];
        [_locationView addSubview:lineView];
    }
    
    return _locationView;
}

-(UIView *)maxLacationView{
    if (!_maxLacationView) {
        _maxLacationView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.locationView.frame), SCREEN_WIDTH, 70*SCREEN_RADIO)];
        _maxLacationView.backgroundColor=[UIColor whiteColor];
        UILabel *locationName=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 10*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        locationName.text=@"最大距离";
        locationName.textColor=[UIColor getColor:@"000000"];
        locationName.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [locationName sizeToFit];
        [_maxLacationView addSubview:locationName];
        
        UILabel *locationContent=[[UILabel alloc] initWithFrame:CGRectMake(0, 10*SCREEN_RADIO, SCREEN_WIDTH-20*SCREEN_RADIO, 15*SCREEN_RADIO)];
        locationContent.text=@"80公里";
        locationContent.textColor=[UIColor getColor:@"666666"];
        locationContent.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        locationContent.textAlignment=NSTextAlignmentRight;
        [_maxLacationView addSubview:locationContent];
        
        
        UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(20*SCREEN_RADIO , CGRectGetMaxY(locationContent.frame)+20*SCREEN_RADIO, SCREEN_WIDTH-40*SCREEN_RADIO, 15*SCREEN_RADIO)];
        //01.minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
        slider.minimumValue = 0.0;
        
        //02.maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
        slider.maximumValue = 100.0;
        
        //03.当前值
        slider.value = 50;
        
        //04.continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
        [slider setContinuous:YES];
        
        //07.minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
        slider.minimumTrackTintColor = [UIColor getColor:@"f94f66"];
        
        //08.maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
        slider.maximumTrackTintColor = [UIColor getColor:@"b5b5b6"];
        
        //09.thumbTintColor : 当前滑块的颜色，默认为白色
        slider.thumbTintColor = [UIColor whiteColor];
        
        //    10.currentMaximumTrackImage : 滑块条最大值处设置的图片
        //    11.currentMinimumTrackImage : 滑块条最小值处设置的图片
        //    12.currentThumbImage: 当前滑块的图片
        
        [slider addTarget:self action:@selector(sliderLocationValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_maxLacationView addSubview:slider];
        

        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 70*SCREEN_RADIO-0.5, SCREEN_WIDTH-15*SCREEN_RADIO, 0.5)];
        lineView.backgroundColor=[UIColor getColor:@"C8c7cc"];
        [_maxLacationView addSubview:lineView];
    }
    
    return _maxLacationView;
}

-(UIView *)sexView{
    if (!_sexView) {
        _sexView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.maxLacationView.frame), SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _sexView.backgroundColor=[UIColor whiteColor];
        UILabel *locationName=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 25*SCREEN_RADIO-7.5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        locationName.text=@"性别";
        locationName.textColor=[UIColor getColor:@"000000"];
        locationName.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [locationName sizeToFit];
        [_sexView addSubview:locationName];
        
        UILabel *locationContent=[[UILabel alloc] initWithFrame:CGRectMake(0, 25*SCREEN_RADIO-7.5*SCREEN_RADIO, SCREEN_WIDTH-30*SCREEN_RADIO, 15*SCREEN_RADIO)];
        locationContent.text=@"女";
        locationContent.textColor=[UIColor getColor:@"666666"];
        locationContent.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        locationContent.textAlignment=NSTextAlignmentRight;
        [_sexView addSubview:locationContent];
        
        UIImageView *allow=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-26*SCREEN_RADIO, 25*SCREEN_RADIO-5.5*SCREEN_RADIO, 6*SCREEN_RADIO, 11*SCREEN_RADIO)];
        allow.image=[UIImage imageNamed:@"myAllowLeft"];
        [_sexView addSubview:allow];
        
        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 50*SCREEN_RADIO-0.5, SCREEN_WIDTH-15*SCREEN_RADIO, 0.5)];
        lineView.backgroundColor=[UIColor getColor:@"C8c7cc"];
        [_sexView addSubview:lineView];
    }
    
    return _sexView;
}

-(UIView *)ageView{
    if (!_ageView) {
        _ageView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sexView.frame), SCREEN_WIDTH, 70*SCREEN_RADIO)];
        _ageView.backgroundColor=[UIColor whiteColor];
        UILabel *locationName=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 10*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        locationName.text=@"年龄范围";
        locationName.textColor=[UIColor getColor:@"000000"];
        locationName.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [locationName sizeToFit];
        [_ageView addSubview:locationName];
        
        UILabel *locationContent=[[UILabel alloc] initWithFrame:CGRectMake(0, 10*SCREEN_RADIO, SCREEN_WIDTH-20*SCREEN_RADIO, 15*SCREEN_RADIO)];
        locationContent.text=@"18-33";
        locationContent.textColor=[UIColor getColor:@"666666"];
        locationContent.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        locationContent.textAlignment=NSTextAlignmentRight;
        [_ageView addSubview:locationContent];
        
        UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(20*SCREEN_RADIO , CGRectGetMaxY(locationContent.frame)+20*SCREEN_RADIO, SCREEN_WIDTH-40*SCREEN_RADIO, 15*SCREEN_RADIO)];
        //01.minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
        slider.minimumValue = 0.0;
        
        //02.maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
        slider.maximumValue = 100.0;
        
        //03.当前值
        slider.value = 50;
        
        //04.continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
        [slider setContinuous:YES];
        
        //07.minimumTrackTintColor : 小于滑块当前值滑块条的颜色，默认为蓝色
        slider.minimumTrackTintColor = [UIColor getColor:@"f94f66"];
        
        //08.maximumTrackTintColor: 大于滑块当前值滑块条的颜色，默认为白色
        slider.maximumTrackTintColor = [UIColor getColor:@"b5b5b6"];
        
        //09.thumbTintColor : 当前滑块的颜色，默认为白色
        slider.thumbTintColor = [UIColor whiteColor];
        
        //    10.currentMaximumTrackImage : 滑块条最大值处设置的图片
        //    11.currentMinimumTrackImage : 滑块条最小值处设置的图片
        //    12.currentThumbImage: 当前滑块的图片
        
        [slider addTarget:self action:@selector(sliderAgeValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_ageView addSubview:slider];
    }
    
    return _ageView;
}

-(UIButton *)logoutBtn{
    if (!_logoutBtn) {
        _logoutBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.ageView.frame)+20*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _logoutBtn.backgroundColor=[UIColor whiteColor];
        [_logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:[UIColor getColor:@"000000"] forState:UIControlStateNormal];
        _logoutBtn.titleLabel.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [_logoutBtn addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _logoutBtn;
}

-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.logoutBtn.frame)+20*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _deleteBtn.backgroundColor=[UIColor whiteColor];
        [_deleteBtn setTitle:@"删除账户" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor getColor:@"FD5068"] forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [_deleteBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteBtn;
}
@end
