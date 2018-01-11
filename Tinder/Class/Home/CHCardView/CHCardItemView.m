//
//  CHCardItemView.m
//  CHCardView
//
//  Created by yaoxin on 16/10/8.
//  Copyright © 2016年 Charles. All rights reserved.
//

#import "CHCardItemView.h"
#import "CHCardItemModel.h"

@interface CHCardItemView()
@property(nonatomic,strong)UIImageView *nope;
@property(nonatomic,strong)UIImageView *like;
@property(nonatomic,strong)UIImageView *superLike;
@end
@implementation CHCardItemView {
    CGPoint _originalCenter;
    CGFloat _currentAngle;
    BOOL _isLeft;
    BOOL _isUp;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _originalCenter = CGPointMake(frame.size.width / 2.0, frame.size.height / 2.0);
        [self addPanGest];
        [self configLayer];
    }
    return self;
}

- (void)addPanGest {
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestHandle:)];
    [self addGestureRecognizer:pan];
}

- (void)configLayer { 
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    _originalCenter = CGPointMake(frame.size.width / 2.0, frame.size.height / 2.0);
}

- (void)panGestHandle:(UIPanGestureRecognizer *)panGest {
    CGPoint movePoint = [panGest translationInView:self];
    if (panGest.state == UIGestureRecognizerStateEnded) {
        CGPoint vel = [panGest velocityInView:panGest.view];
        if (_isUp) {
            if (vel.y>-40) {
                self.nope.layer.opacity=0;
                self.like.layer.opacity=0;
                self.superLike.layer.opacity=0;
                self.layer.opacity=1.0;
                [UIView animateWithDuration:0.5 animations:^{
                    self.layer.opacity=0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [self removeFromSuperview];
                    }
                }];
            }else{
                [UIView animateWithDuration:0.5 animations:^{
                    self.center = _originalCenter;
                    self.transform = CGAffineTransformMakeRotation(0);
                    self.nope.layer.opacity=0;
                    self.like.layer.opacity=0;
                    self.superLike.layer.opacity=0;
                }];
            }
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                self.center = _originalCenter;
                self.transform = CGAffineTransformMakeRotation(0);
                self.nope.layer.opacity=0;
                self.like.layer.opacity=0;
                self.superLike.layer.opacity=0;
            }];
            if (vel.x > 800 || vel.x < - 800) {
                [self remove];
                self.nope.layer.opacity=0;
                self.like.layer.opacity=0;
                self.superLike.layer.opacity=0;
                return ;
            }
            if (self.frame.origin.x + self.frame.size.width > 150 && self.frame.origin.x < self.frame.size.width - 150) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.center = _originalCenter;
                    self.transform = CGAffineTransformMakeRotation(0);
                    self.nope.layer.opacity=0;
                    self.like.layer.opacity=0;
                    self.superLike.layer.opacity=0;
                }];
            } else {
                self.nope.layer.opacity=0;
                self.like.layer.opacity=0;
                self.superLike.layer.opacity=0;
                [self remove];
            }
        }
        
    }else if (panGest.state == UIGestureRecognizerStateChanged){

        self.center = CGPointMake(self.center.x + movePoint.x, self.center.y + movePoint.y);
        
        CGFloat angle = (self.center.x - self.frame.size.width / 2.0) / self.frame.size.width / 4.0;
        _currentAngle = angle;
        
        self.transform = CGAffineTransformMakeRotation(angle);
        
        [panGest setTranslation:CGPointZero inView:self];
        
        CGPoint velocity = [panGest velocityInView:panGest.view];
        if(velocity.y<0){
            [self addSubview:self.superLike];
            self.nope.layer.opacity=0;
            self.like.layer.opacity=0;
            self.superLike.layer.opacity=1;
            _isUp=YES;
        }else{
            _isUp=NO;
            if(velocity.x>30)
            {//向右滑动
                self.nope.layer.opacity=0;
                self.like.layer.opacity=1;
                self.superLike.layer.opacity=0;
                [self addSubview:self.like];
                _isLeft=NO;
            }else if(velocity.x<-30){//向左滑动
                [self addSubview:self.nope];
                self.nope.layer.opacity=1;
                self.like.layer.opacity=0;
                self.superLike.layer.opacity=0;
                _isLeft=YES;
            }
        }
    }
}

- (void)remove {
    [UIView animateWithDuration:0.3 animations:^{
        
        // right
        if (!_isLeft) {
            self.center = CGPointMake(self.frame.size.width + 1000, self.center.y + _currentAngle * self.frame.size.height);
        } else { // left
            self.center = CGPointMake(- 1000, self.center.y - _currentAngle * self.frame.size.height);
        }
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            if ([self.delegate respondsToSelector:@selector(cardItemViewDidRemoveFromSuperView:)]) {
                [self.delegate cardItemViewDidRemoveFromSuperView:self];
            }
        }
    }];
    
}

- (void)removeWithLeft:(BOOL)left {
    [UIView animateWithDuration:0.5 animations:^{
        if (!left) {
            self.nope.layer.opacity=0;
            self.like.layer.opacity=1;
            self.superLike.layer.opacity=0;
            [self addSubview:self.like];
        }else{
            [self addSubview:self.nope];
            self.nope.layer.opacity=1;
            self.like.layer.opacity=0;
            self.superLike.layer.opacity=0;
        }
    } completion:nil];
    
    [UIView animateWithDuration:1.5 animations:^{
        
        // right
        if (!left) {
            self.center = CGPointMake(self.frame.size.width + 1000, self.center.y + _currentAngle * self.frame.size.height + (_currentAngle == 0 ? 100 : 0));
        } else { // left
            self.center = CGPointMake(- 1000, self.center.y - _currentAngle * self.frame.size.height + (_currentAngle == 0 ? 100 : 0));
        }
    } completion:^(BOOL finished) {
        if (finished) {
            self.nope.layer.opacity=0;
            self.like.layer.opacity=0;
            self.superLike.layer.opacity=0;
            [self removeFromSuperview];
            if ([self.delegate respondsToSelector:@selector(cardItemViewDidRemoveFromSuperView:)]) {
                [self.delegate cardItemViewDidRemoveFromSuperView:self];
            }
        }
    }];
}

- (void)superLikeItem{
    [UIView animateWithDuration:0.5 animations:^{
        [self addSubview:self.superLike];
        self.nope.layer.opacity=0;
        self.like.layer.opacity=0;
        self.superLike.layer.opacity=1;
    } completion:nil];
    
    [UIView animateWithDuration:1.5 animations:^{
        self.center = CGPointMake(SCREEN_WIDTH/2, -1000);
    } completion:^(BOOL finished) {
        if (finished) {
            self.nope.layer.opacity=0;
            self.like.layer.opacity=0;
            self.superLike.layer.opacity=0;
            [self removeFromSuperview];
        }
    }];
}

-(UIImageView *)nope{
    if (!_nope) {
        _nope=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-182*SCREEN_RADIO, 5*SCREEN_RADIO, 167*SCREEN_RADIO, 110*SCREEN_RADIO)];
        _nope.image=[UIImage imageNamed:@"Nopepit"];
        _nope.layer.opacity=0.0;
    }
    
    return _nope;
}

-(UIImageView *)like{
    if (!_like) {
        _like=[[UIImageView alloc] initWithFrame:CGRectMake(5*SCREEN_RADIO, 5*SCREEN_RADIO, 167*SCREEN_RADIO, 110*SCREEN_RADIO)];
        _like.image=[UIImage imageNamed:@"Likepit"];
        _like.layer.opacity=0.0;
    }
    
    return _like;
}

-(UIImageView *)superLike{
    if (!_superLike) {
        _superLike=[[UIImageView alloc] initWithFrame:CGRectMake(32*SCREEN_RADIO, self.frame.size.height-192*SCREEN_RADIO, 216*SCREEN_RADIO, 155*SCREEN_RADIO)];
        _superLike.image=[UIImage imageNamed:@"SuperLikepit"];
        _superLike.layer.opacity=0.0;
    }
    
    return _superLike;
}
@end
