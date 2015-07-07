//
//  WJCommon.h
//  XMPP_QQ
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 tqh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJCommon : NSObject

//NSUserDefault使用
/**
 *  设置NSUserDefault
 */
+ (void)setNSUserDefaults:(NSString *)string;
/**
 *  取出NSUserDefault
 *
 *  @param string 键的名称
 *
 *  @return 字符串
 */
+ (NSString *)getNSUserDefaults:(NSString *)string;
/**
 *  删除NSUserDefault
 *
 *  @param string 键的名称
 */
+ (void)deleteNSUserDefaults:(NSString *)string;

@end
