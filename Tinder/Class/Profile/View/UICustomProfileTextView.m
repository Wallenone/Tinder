//
//  UICustomProfileTextView.m
//  Tinder
//
//  Created by wallen on 2018/2/8.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "UICustomProfileTextView.h"
@interface UICustomProfileTextView()<UITextViewDelegate>{
    UpdateHeightBlock updateHeightBlock;
}
@property(nonatomic,strong)UILabel *count;
@end
@implementation UICustomProfileTextView

- (instancetype)initWithFrame:(CGRect)frame withUpdateHeight:(UpdateHeightBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        updateHeightBlock=block;
        [self buildingDefaultParamsAndAddObserver];
    }
    return self;
}



-(void)reloadViews{
    [self setNeedsDisplay];
    self.count.text=[NSString stringWithFormat:@"%ld",MAX(0,self.maxNum - self.text.length)];
    self.count.hidden=self.hiddenMaxState;
}

- (void)buildingDefaultParamsAndAddObserver {
    _leftMarggin = 15*SCREEN_RADIO;
    _topMarggin = 15*SCREEN_RADIO;
    _placeholderFont = [UIFont boldSystemFontOfSize:15*SCREEN_RADIO];
    _placeholderColor = [UIColor grayColor];
    self.delegate=self;
    self.textContainerInset = UIEdgeInsetsMake(15*SCREEN_RADIO, 12*SCREEN_RADIO, 0, 15*SCREEN_RADIO);
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [self addSubview:self.count];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    NSInteger caninputlen = self.maxNum - comcatstr.length;
    
    if (caninputlen >= 0)
    {
        
        return YES;
    }
    else
    {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0)
        {
            NSString *s = [text substringWithRange:rg];
            
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
    
}

- (void)textViewDidChange:(UITextView *)textView{
    [self setNeedsDisplay];
    
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    
    CGRect rect = textView.frame;
    rect.size.height =textView.contentSize.height+15*SCREEN_RADIO;
    textView.frame = rect;
    [[IQKeyboardManager sharedManager] reloadLayoutIfNeeded];
    self.count.frame=CGRectMake(SCREEN_WIDTH/2, self.contentSize.height-5*SCREEN_RADIO, SCREEN_WIDTH/2-10*SCREEN_RADIO, 13*SCREEN_RADIO);
    
    self.count.text=[NSString stringWithFormat:@"%ld",MAX(0,self.maxNum - existTextNum)];
    if(updateHeightBlock){
       updateHeightBlock(rect.size.height);
    }
    
}

- (void)drawRect:(CGRect)rect {
    if (self.text.length > 0) { } else {
        NSDictionary *dictionary = @{NSFontAttributeName: _placeholderFont, NSForegroundColorAttributeName: _placeholderColor};
        [self.placeholder drawInRect:CGRectMake(_leftMarggin, _topMarggin, self.bounds.size.width, self.bounds.size.height) withAttributes:dictionary];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark - setter methods
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}


//控制placeHolder的位置，左右缩20
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+20*SCREEN_RADIO, bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    return inset;
}


//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );

    CGRect inset = CGRectMake(bounds.origin.x +15*SCREEN_RADIO, bounds.origin.y, bounds.size.width -15*SCREEN_RADIO, bounds.size.height);
    return inset;
}

-(UILabel *)count{
    if(!_count){
        _count=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, self.contentSize.height-10*SCREEN_RADIO, SCREEN_WIDTH/2-10*SCREEN_RADIO, 13*SCREEN_RADIO)];
        _count.font = [UIFont systemFontOfSize:13*SCREEN_RADIO];
        _count.textColor=[UIColor getColor:@"808080"];
        _count.textAlignment=NSTextAlignmentRight;
    }
    
    return _count;
}
@end
