//
//  TinerCommonControl.h
//  Tinder
//
//  Created by wallen on 2018/2/8.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileIndexView.h"
@interface TinerCommonControl : NSObject
@property(nonatomic,strong)ProfileIndexView *profileVC;
+ (instancetype)sharedManager;
-(void)showProfile;
-(void)hideProfile;
@end
