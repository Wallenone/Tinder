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
@interface LeftMenuViewDemo (){
    NSInteger _currentTag;
}
@property(nonatomic,strong)UIImageView *diImgView;
@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nickNameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *pitImgView;
@property(nonatomic,strong)EZJFastTableView *tbv;
@end

@implementation LeftMenuViewDemo

 
-(instancetype)initWithFrame:(CGRect)frame{

    if(self = [super initWithFrame:frame]){
        self.backgroundColor=[UIColor getColor:@"3D457F"];
        [self addSubViews];
    }
    return  self;
}

-(void)addSubViews{
    [self addSubview:self.diImgView];
    [self addSubview:self.iconImgView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.pitImgView];
    [self addSubview:self.tbv];
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
        _nickNameLabel.font=[UIFont systemFontOfSize:16*SCREEN_RADIO];
        [_nickNameLabel sizeToFit];
    }
    
    return _nickNameLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImgView.frame)+23*SCREEN_RADIO, CGRectGetMaxY(self.nickNameLabel.frame)+8*SCREEN_RADIO, 0, 18*SCREEN_RADIO)];
        _contentLabel.text=@"will@evrybo.com";
        _contentLabel.textColor=[UIColor getColor:@"898FD3"];
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

-(EZJFastTableView *)tbv{
    if (!_tbv) {
       
        CGRect tbvFrame = CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame)+56*SCREEN_RADIO, 245*SCREEN_RADIO, 345*SCREEN_RADIO);
        //初始化
        
        _tbv = [[EZJFastTableView alloc]initWithFrame:tbvFrame];
        _tbv.backgroundColor=[UIColor getColor:@"3D457F"];
        _tbv.separatorStyle=UITableViewCellSeparatorStyleNone;
        //给tableview赋值
         [_tbv setDataArray:@[@"Index",@"Drafts",@"Starred",@"Sent",@"Trash",@"Archive"]];
        
        [_tbv onBuildCell:^(id cellData,NSString *cellIdentifier,NSIndexPath *index) {
            LeftMenuCell *cell=[[LeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier WithContent:cellData withIcon:cellData];
            return cell;
        }];
        
        //动态改变
        [_tbv onChangeCellHeight:^CGFloat(NSIndexPath *indexPath,id cellData) {
            return 45*SCREEN_RADIO;
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
