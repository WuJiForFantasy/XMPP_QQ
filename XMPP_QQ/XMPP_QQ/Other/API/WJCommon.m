//
//  WJCommon.m
//  XMPP_QQ
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 tqh. All rights reserved.
//

#import "WJCommon.h"

@implementation WJCommon

+ (void)setNSUserDefaults:(NSString *)string {
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (NSString *)getNSUserDefaults:(NSString *)string {
    return [[NSUserDefaults standardUserDefaults]objectForKey:string];
}
+ (void)deleteNSUserDefaults:(NSString *)string {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:string];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
