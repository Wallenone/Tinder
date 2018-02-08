//
//  TinerCommonControl.m
//  Tinder
//
//  Created by wallen on 2018/2/8.
//  Copyright © 2018年 wallen. All rights reserved.
//

#import "TinerCommonControl.h"

@implementation TinerCommonControl

+ (instancetype)sharedManager
{
    static TinerCommonControl *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TinerCommonControl alloc] init];
        
    });
    return manager;
}

-(void)showProfile{
    [self.profileVC show];
}

-(void)hideProfile{
    [self.profileVC hidenWithAnimation];
}

@end
