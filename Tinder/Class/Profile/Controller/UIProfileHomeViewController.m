//
//  UIProfileHomeViewController.m
//  Tinder
//
//  Created by wallen on 2018/2/8.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UIProfileHomeViewController.h"
#import "UICustomProfileTextView.h"
#import "WYGenderPickerView.h"
#import "WYBirthdayPickerView.h"
@interface UIProfileHomeViewController (){
    CGFloat _picHeight;
}
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)RkyExtendedHitButton *leftBack;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)RkyExtendedHitButton *rightBtn;
@property(nonatomic,strong)UIView *picView;
@property(nonatomic,strong)UIButton *picBtn1;
@property(nonatomic,strong)UIButton *picBtn2;
@property(nonatomic,strong)UIButton *picBtn3;
@property(nonatomic,strong)UIButton *picBtn4;
@property(nonatomic,strong)UIButton *picBtn5;
@property(nonatomic,strong)UIButton *picBtn6;
@property(nonatomic,strong)UILabel *nickName;
@property(nonatomic,strong)UICustomProfileTextView *nickNameTextView;
@property(nonatomic,strong)UILabel *aboutUs;
@property(nonatomic,strong)UICustomProfileTextView *aboutTextView;
@property(nonatomic,strong)UILabel *zhiwei;
@property(nonatomic,strong)UICustomProfileTextView *zhiweiTextView;
@property(nonatomic,strong)UILabel *company;
@property(nonatomic,strong)UICustomProfileTextView *companyTextView;
@property(nonatomic,strong)UILabel *school;
@property(nonatomic,strong)UICustomProfileTextView *schoolTextView;
@property(nonatomic,strong)UILabel *sex;
@property(nonatomic,strong)UIView *sexView;
@property(nonatomic,strong)UILabel *birthDay;
@property(nonatomic,strong)UIView *birthDayView;
@end

@implementation UIProfileHomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _picHeight=(SCREEN_WIDTH-60*SCREEN_RADIO)/3;
    self.view.backgroundColor=[UIColor getColor:@"EFEFF4"];
    [self addSubViews];
}

-(void)addSubViews{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.titleLabel];
    [self.headerView addSubview:self.leftBack];
    [self.headerView addSubview:self.rightBtn];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.picView];
    [self.picView addSubview:self.picBtn1];
    [self.picView addSubview:self.picBtn2];
    [self.picView addSubview:self.picBtn3];
    [self.picView addSubview:self.picBtn4];
    [self.picView addSubview:self.picBtn5];
    [self.picView addSubview:self.picBtn6];
    [self.scrollView addSubview:self.nickName];
    [self.scrollView addSubview:self.nickNameTextView];
    [self.scrollView addSubview:self.aboutUs];
    [self.scrollView addSubview:self.aboutTextView];
    [self.scrollView addSubview:self.zhiwei];
    [self.scrollView addSubview:self.zhiweiTextView];
    [self.scrollView addSubview:self.company];
    [self.scrollView addSubview:self.companyTextView];
    [self.scrollView addSubview:self.school];
    [self.scrollView addSubview:self.schoolTextView];
    [self.scrollView addSubview:self.sex];
    [self.scrollView addSubview:self.sexView];
    [self.scrollView addSubview:self.birthDay];
    [self.scrollView addSubview:self.birthDayView];
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.birthDayView.frame)+20*SCREEN_RADIO)];
    
}

-(void)setTextFrame{
    self.nickName.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.picView.frame), 0, 13*SCREEN_RADIO);
    [self.nickName sizeToFit];
    self.nickNameTextView.frame=CGRectMake(0, CGRectGetMaxY(self.nickName.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.nickNameTextView.frame.size.height);
    
    self.aboutUs.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.nickNameTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    [self.aboutUs sizeToFit];
    self.aboutTextView.frame=CGRectMake(0, CGRectGetMaxY(self.aboutUs.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.aboutTextView.frame.size.height);
    
    
    self.zhiwei.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.aboutTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    [self.zhiwei sizeToFit];
    self.zhiweiTextView.frame=CGRectMake(0, CGRectGetMaxY(self.zhiwei.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.zhiweiTextView.frame.size.height);
    self.company.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.zhiweiTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    [self.company sizeToFit];
    self.companyTextView.frame=CGRectMake(0, CGRectGetMaxY(self.company.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.companyTextView.frame.size.height);
    self.school.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.companyTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    [self.school sizeToFit];
    self.schoolTextView.frame=CGRectMake(0, CGRectGetMaxY(self.school.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.schoolTextView.frame.size.height);
    
    
    self.sex.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.schoolTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    [self.sex sizeToFit];
    self.sexView.frame=CGRectMake(0, CGRectGetMaxY(self.sex.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, self.sexView.frame.size.height);
    
    self.birthDay.frame=CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.sexView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO);
    self.birthDayView.frame=CGRectMake(0, CGRectGetMaxY(self.birthDay.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO);
    
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.birthDayView.frame)+20*SCREEN_RADIO)];
}

-(void)back{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)saveClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)picClick1{
    
}

-(void)picClick2{
    
}

-(void)picClick3{
    
}

-(void)picClick4{
    
}

-(void)picClick5{
    
}

-(void)picClick6{
    
}


-(void)sexClick{
    WYGenderPickerView *customPickerSex=[[WYGenderPickerView alloc] initWithInitialGender:NSLocalizedString(@"sex_man", nil)];
    __weak __typeof(self)weakSelf = self;
    customPickerSex.confirmBlock = ^(NSString *selectedGender){
        UILabel *label = [weakSelf.view viewWithTag:3101];
        label.text=selectedGender;
        
    };
    
    [self.view addSubview:customPickerSex];
}

-(void)birthDayClick{
    WYBirthdayPickerView *birthdayPickerView = [[WYBirthdayPickerView alloc] initWithInitialDate:@"1990-01-01"];
    __weak __typeof(self)weakSelf = self;
    // 选择日期完成之后的回调 : 按自己的要求做相应的处理就可以了
    birthdayPickerView.confirmBlock = ^(NSString *selectedDate) {
        UILabel *label = [weakSelf.view viewWithTag:3102];
        label.text=selectedDate;
    };
    
    [self.view addSubview:birthdayPickerView];
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
        _titleLabel.text=@"编辑信息";
        _titleLabel.textColor=[UIColor getColor:@"000000"];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

-(RkyExtendedHitButton *)leftBack{
    if(!_leftBack){
        _leftBack=[[RkyExtendedHitButton alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 30*SCREEN_RADIO, 12*SCREEN_RADIO, 16*SCREEN_RADIO)];
        [_leftBack setImage:[UIImage imageNamed:@"BlackArrowleft"] forState:UIControlStateNormal];
        [_leftBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _leftBack.hitTestEdgeInsets = UIEdgeInsetsMake(-25, -25, -25, -25);
    }
    
    return _leftBack;
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

-(UIView *)picView{
    if(!_picView){
        _picView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _picHeight*3+90*SCREEN_RADIO)];
    }
    
    return _picView;
}

-(UIButton *)picBtn1{
    if(!_picBtn1){
        _picBtn1=[[UIButton alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, 10*SCREEN_RADIO, _picHeight*2+20*SCREEN_RADIO, _picHeight*2+20*SCREEN_RADIO)];
        [_picBtn1 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn1 addTarget:self action:@selector(picClick1) forControlEvents:UIControlEventTouchUpInside];
        _picBtn1.layer.cornerRadius=5;
        _picBtn1.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"1";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn1 addSubview:label];
    }
    
    return _picBtn1;
}

-(UIButton *)picBtn2{
    if(!_picBtn2){
        _picBtn2=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picBtn1.frame)+20*SCREEN_RADIO, 10*SCREEN_RADIO, _picHeight, _picHeight)];
        [_picBtn2 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn2 addTarget:self action:@selector(picClick2) forControlEvents:UIControlEventTouchUpInside];
        _picBtn2.layer.cornerRadius=5;
        _picBtn2.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"2";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn2 addSubview:label];
    }
    
    return _picBtn2;
}

-(UIButton *)picBtn3{
    if(!_picBtn3){
        _picBtn3=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picBtn1.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.picBtn2.frame)+20*SCREEN_RADIO, _picHeight, _picHeight)];
        [_picBtn3 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn3 addTarget:self action:@selector(picClick3) forControlEvents:UIControlEventTouchUpInside];
        _picBtn3.layer.cornerRadius=5;
        _picBtn3.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"3";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn3 addSubview:label];
    }
    
    return _picBtn3;
}

-(UIButton *)picBtn4{
    if(!_picBtn4){
        _picBtn4=[[UIButton alloc] initWithFrame:CGRectMake(10*SCREEN_RADIO, CGRectGetMaxY(self.picBtn1.frame)+20*SCREEN_RADIO, _picHeight, _picHeight)];
        [_picBtn4 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn4 addTarget:self action:@selector(picClick4) forControlEvents:UIControlEventTouchUpInside];
        _picBtn4.layer.cornerRadius=5;
        _picBtn4.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"4";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn4 addSubview:label];
    }
    
    return _picBtn4;
}

-(UIButton *)picBtn5{
    if(!_picBtn5){
        _picBtn5=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picBtn4.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.picBtn1.frame)+20*SCREEN_RADIO, _picHeight, _picHeight)];
        [_picBtn5 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn5 addTarget:self action:@selector(picClick5) forControlEvents:UIControlEventTouchUpInside];
        _picBtn5.layer.cornerRadius=5;
        _picBtn5.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"5";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn5 addSubview:label];
    }
    
    return _picBtn5;
}

-(UIButton *)picBtn6{
    if(!_picBtn6){
        _picBtn6=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.picBtn5.frame)+20*SCREEN_RADIO, CGRectGetMaxY(self.picBtn3.frame)+20*SCREEN_RADIO, _picHeight, _picHeight)];
        [_picBtn6 setBackgroundColor:[UIColor getColor:@"DFDFE4"]];
        [_picBtn6 addTarget:self action:@selector(picClick6) forControlEvents:UIControlEventTouchUpInside];
        _picBtn6.layer.cornerRadius=5;
        _picBtn6.clipsToBounds=YES;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 0, 15*SCREEN_RADIO)];
        label.text=@"6";
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        [label sizeToFit];
        [_picBtn6 addSubview:label];
    }
    
    return _picBtn6;
}

-(UILabel *)nickName{
    if(!_nickName){
        _nickName=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.picView.frame), 0, 13*SCREEN_RADIO)];
        _nickName.text=@"昵称";
        _nickName.textColor=[UIColor getColor:@"4d4d4d"];
        _nickName.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_nickName sizeToFit];
    }
    
    return _nickName;
}

-(UICustomProfileTextView *)nickNameTextView{
    if(!_nickNameTextView){
        __weak __typeof(self)weakSelf = self;
        _nickNameTextView=[[UICustomProfileTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nickName.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO) withUpdateHeight:^(CGFloat height) {
            [weakSelf setTextFrame];
        }];
        _nickNameTextView.backgroundColor=[UIColor whiteColor];
        _nickNameTextView.placeholder=@"添加昵称";
        _nickNameTextView.placeholderColor=[UIColor getColor:@"ABABAB"];
        _nickNameTextView.textColor=[UIColor getColor:@"555555"];
        _nickNameTextView.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        _nickNameTextView.maxNum=20;
        _nickNameTextView.hiddenMaxState=YES;
        [_nickNameTextView reloadViews];
    }
    
    return _nickNameTextView;
}

-(UILabel *)aboutUs{
    if(!_aboutUs){
        _aboutUs=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.nickNameTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _aboutUs.text=@"关于 Wallen";
        _aboutUs.textColor=[UIColor getColor:@"4d4d4d"];
        _aboutUs.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_aboutUs sizeToFit];
    }
    
    return _aboutUs;
}

-(UICustomProfileTextView *)aboutTextView{
    if(!_aboutTextView){
        __weak __typeof(self)weakSelf = self;
        _aboutTextView=[[UICustomProfileTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.aboutUs.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO) withUpdateHeight:^(CGFloat height) {
            [weakSelf setTextFrame];
        }];
        _aboutTextView.backgroundColor=[UIColor whiteColor];
        _aboutTextView.placeholder=@"添加信息";
        _aboutTextView.placeholderColor=[UIColor getColor:@"ABABAB"];
        _aboutTextView.textColor=[UIColor getColor:@"555555"];
        _aboutTextView.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        _aboutTextView.maxNum=500;
        _aboutTextView.hiddenMaxState=NO;
        [_aboutTextView reloadViews];
    }
    
    return _aboutTextView;
}

-(UILabel *)zhiwei{
    if(!_zhiwei){
        _zhiwei=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.aboutTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _zhiwei.text=@"职位";
        _zhiwei.textColor=[UIColor getColor:@"4d4d4d"];
        _zhiwei.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_zhiwei sizeToFit];
    }
    
    return _zhiwei;
}

-(UICustomProfileTextView *)zhiweiTextView{
    if(!_zhiweiTextView){
        __weak __typeof(self)weakSelf = self;
        _zhiweiTextView=[[UICustomProfileTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.zhiwei.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO) withUpdateHeight:^(CGFloat height) {
            [weakSelf setTextFrame];
        }];
        _zhiweiTextView.backgroundColor=[UIColor whiteColor];
        _zhiweiTextView.placeholder=@"添加职位";
        _zhiweiTextView.placeholderColor=[UIColor getColor:@"ABABAB"];
        _zhiweiTextView.textColor=[UIColor getColor:@"555555"];
        _zhiweiTextView.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        _zhiweiTextView.maxNum=25;
        _zhiweiTextView.hiddenMaxState=YES;
        [_zhiweiTextView reloadViews];
    }
    
    return _zhiweiTextView;
}

-(UILabel *)company{
    if(!_company){
        _company=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.zhiweiTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _company.text=@"公司";
        _company.textColor=[UIColor getColor:@"4d4d4d"];
        _company.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_company sizeToFit];
    }
    
    return _company;
}

-(UICustomProfileTextView *)companyTextView{
    if(!_companyTextView){
        __weak __typeof(self)weakSelf = self;
        _companyTextView=[[UICustomProfileTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.company.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO) withUpdateHeight:^(CGFloat height) {
            [weakSelf setTextFrame];
        }];
        _companyTextView.backgroundColor=[UIColor whiteColor];
        _companyTextView.placeholder=@"添加公司";
        _companyTextView.placeholderColor=[UIColor getColor:@"ABABAB"];
        _companyTextView.textColor=[UIColor getColor:@"555555"];
        _companyTextView.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        _companyTextView.maxNum=25;
        _companyTextView.hiddenMaxState=YES;
        [_companyTextView reloadViews];
    }
    
    return _companyTextView;
}

-(UILabel *)school{
    if(!_school){
        _school=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.companyTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _school.text=@"学校";
        _school.textColor=[UIColor getColor:@"4d4d4d"];
        _school.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_school sizeToFit];
    }
    
    return _school;
}

-(UICustomProfileTextView *)schoolTextView{
    if(!_schoolTextView){
        __weak __typeof(self)weakSelf = self;
        _schoolTextView=[[UICustomProfileTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.school.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO) withUpdateHeight:^(CGFloat height) {
            [weakSelf setTextFrame];
        }];
        _schoolTextView.backgroundColor=[UIColor whiteColor];
        _schoolTextView.placeholder=@"添加学校";
        _schoolTextView.placeholderColor=[UIColor getColor:@"ABABAB"];
        _schoolTextView.textColor=[UIColor getColor:@"555555"];
        _schoolTextView.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        _schoolTextView.maxNum=25;
        _schoolTextView.hiddenMaxState=YES;
        [_schoolTextView reloadViews];
    }
    
    return _schoolTextView;
}

-(UILabel *)sex{
    if(!_sex){
        _sex=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.schoolTextView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _sex.text=@"性别";
        _sex.textColor=[UIColor getColor:@"4d4d4d"];
        _sex.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_sex sizeToFit];
    }
    
    return _sex;
}

-(UIView *)sexView{
    if(!_sexView){
        _sexView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sex.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _sexView.backgroundColor=[UIColor whiteColor];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 25*SCREEN_RADIO-7.5*SCREEN_RADIO, 100*SCREEN_RADIO, 15*SCREEN_RADIO)];
        label.text=@"男";
        label.textColor=[UIColor getColor:@"ABABAB"];
        label.font=[UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
        label.textAlignment=NSTextAlignmentLeft;
        label.tag=3101;
        [_sexView addSubview:label];
        
        UIImageView *allow=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-36*SCREEN_RADIO, 25*SCREEN_RADIO-5.5*SCREEN_RADIO, 6*SCREEN_RADIO, 11*SCREEN_RADIO)];
        allow.image=[UIImage imageNamed:@"myAllowLeft"];
        [_sexView addSubview:allow];
        
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        [btn addTarget:self action:@selector(sexClick) forControlEvents:UIControlEventTouchUpInside];
        [_sexView addSubview:btn];
    }
    
    return _sexView;
}

-(UILabel *)birthDay{
    if(!_birthDay){
        _birthDay=[[UILabel alloc]initWithFrame:CGRectMake(15*SCREEN_RADIO, CGRectGetMaxY(self.sexView.frame)+30*SCREEN_RADIO, 0, 13*SCREEN_RADIO)];
        _birthDay.text=@"生日";
        _birthDay.textColor=[UIColor getColor:@"4d4d4d"];
        _birthDay.font=[UIFont boldSystemFontOfSize:13*SCREEN_RADIO];
        [_birthDay sizeToFit];
    }
    
    return _birthDay;
}

-(UIView *)birthDayView{
    if(!_birthDayView){
        _birthDayView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.birthDay.frame)+5*SCREEN_RADIO, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        _birthDayView.backgroundColor=[UIColor whiteColor];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(15*SCREEN_RADIO, 25*SCREEN_RADIO-7.5*SCREEN_RADIO, 100*SCREEN_RADIO, 15*SCREEN_RADIO)];
        label.text=@"1990-01-01";
        label.textColor=[UIColor getColor:@"ABABAB"];
        label.font=[UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
        label.textAlignment=NSTextAlignmentLeft;
        label.tag=3102;
        [_birthDayView addSubview:label];
        
        UIImageView *allow=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-36*SCREEN_RADIO, 25*SCREEN_RADIO-5.5*SCREEN_RADIO, 6*SCREEN_RADIO, 11*SCREEN_RADIO)];
        allow.image=[UIImage imageNamed:@"myAllowLeft"];
        [_birthDayView addSubview:allow];
        
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50*SCREEN_RADIO)];
        [btn addTarget:self action:@selector(birthDayClick) forControlEvents:UIControlEventTouchUpInside];
        [_birthDayView addSubview:btn];
    }
    
    return _birthDayView;
}
@end


