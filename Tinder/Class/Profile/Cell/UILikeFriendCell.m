//
//  UILikeFriendCell.m
//  Tinder
//
//  Created by wallen on 2018/2/23.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UILikeFriendCell.h"
@interface UILikeFriendCell()
@property(nonatomic,strong)UIView *cellcontentView;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *imgBtn;
@property(nonatomic,strong)UIView *cellcontentView1;
@property(nonatomic,strong)UIImageView *imgView1;
@property(nonatomic,strong)UILabel *contentLabel1;
@property(nonatomic,strong)UIButton *imgBtn1;
@end
@implementation UILikeFriendCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withModel:(NSArray *)model{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor getColor:@"ECECEC"];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self creatSubView];
    }
    
    return self;
}

-(void)creatSubView{
    [self addSubview:self.cellcontentView];
    [self addSubview:self.cellcontentView1];
    [self.cellcontentView addSubview:self.imgView];
    [self.cellcontentView addSubview:self.contentLabel];
    [self.cellcontentView1 addSubview:self.imgView1];
    [self.cellcontentView1 addSubview:self.contentLabel1];
    [self.cellcontentView addSubview:self.imgBtn];
    [self.cellcontentView1 addSubview:self.imgBtn1];
}

-(void)imgClick1:(UIButton *)sender{
    
}

-(void)imgClick2:(UIButton *)sender{
    
}

-(UIView *)cellcontentView{
    if (!_cellcontentView) {
        _cellcontentView=[[UIView alloc] initWithFrame:CGRectMake(17*SCREEN_RADIO, 20*SCREEN_RADIO, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 155*SCREEN_RADIO)];
        _cellcontentView.layer.cornerRadius=5;
        _cellcontentView.backgroundColor=[UIColor getColor:@"ffffff"];
    }
    
    return _cellcontentView;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 105.5*SCREEN_RADIO)];
        _imgView.image=[UIImage imageNamed:@"4"];
        _imgView.layer.cornerRadius=5;
        _imgView.clipsToBounds=YES;
    }
    
    return _imgView;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame), (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 37*SCREEN_RADIO)];
        _contentLabel.text=@"Travels\n256 Images";
        _contentLabel.textColor=[UIColor getColor:@"8A8E91"];
        _contentLabel.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        _contentLabel.textAlignment=NSTextAlignmentCenter;
        _contentLabel.numberOfLines=2;
    }
    
    return _contentLabel;
}

-(UIButton *)imgBtn{
    if (!_imgBtn) {
        _imgBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 155*SCREEN_RADIO)];
        [_imgBtn addTarget:self action:@selector(imgClick1:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _imgBtn;
}

-(UIView *)cellcontentView1{
    if (!_cellcontentView1) {
        _cellcontentView1=[[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.cellcontentView.frame)+20*SCREEN_RADIO, 20*SCREEN_RADIO, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 155*SCREEN_RADIO)];
        _cellcontentView1.layer.cornerRadius=5;
        _cellcontentView1.backgroundColor=[UIColor getColor:@"ffffff"];
    }
    
    return _cellcontentView1;
}

-(UIImageView *)imgView1{
    if (!_imgView1) {
        _imgView1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 105.5*SCREEN_RADIO)];
        _imgView1.image=[UIImage imageNamed:@"4"];
        _imgView1.layer.cornerRadius=5;
        _imgView1.clipsToBounds=YES;
    }
    
    return _imgView1;
}

-(UILabel *)contentLabel1{
    if (!_contentLabel1) {
        _contentLabel1=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame), (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 37*SCREEN_RADIO)];
        _contentLabel1.text=@"Travels\n256 Images";
        _contentLabel1.textColor=[UIColor getColor:@"8A8E91"];
        _contentLabel1.font=[UIFont systemFontOfSize:15*SCREEN_RADIO];
        _contentLabel1.textAlignment=NSTextAlignmentCenter;
        _contentLabel1.numberOfLines=2;
    }
    
    return _contentLabel1;
}

-(UIButton *)imgBtn1{
    if (!_imgBtn1) {
        _imgBtn1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-54*SCREEN_RADIO)/2, 155*SCREEN_RADIO)];
        [_imgBtn1 addTarget:self action:@selector(imgClick2:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _imgBtn1;
}
@end
