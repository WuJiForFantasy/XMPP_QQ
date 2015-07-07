//
//  LoginControl.m
//  XMPP_QQ
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 tqh. All rights reserved.
//

#import "LoginControl.h"
#import "WJTextField.h"
@interface LoginControl () {
    WJTextField *_userName;//名称
    WJTextField *_passWord;//密码
    WJTextField *_code;    //服务器地址
}

@end

@implementation LoginControl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)initView {
    _userName = [[WJTextField alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _passWord = [[WJTextField alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _code = [[WJTextField alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
   
    NSInteger screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    NSInteger screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    
    [self.view addSubview:_userName];
    [self.view addSubview:_passWord];
    [self.view addSubview:_code];
    
}

@end
