//
//  WJTabBarControl.m
//  自定义UITabBar
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 tqh. All rights reserved.
//

#import "WJTabBarControl.h"
#import "WJTabBarButton.h"
#import "ChatControl.h"
#import "DynamicControl.h"
#import "FriendControl.h"

#define tabBarHeight 50

@interface WJTabBarControl () {
    UIImageView *_tabBarView;//自定义tabBar
    WJTabBarButton *_oldButton;//记录前一次选择de1按钮
    CGRect _rect;
}

@end

@implementation WJTabBarControl

- (void)viewDidLoad {
    [super viewDidLoad];
// NSObject
    //添加自己的ViewController
    
    ChatControl *vc1 = [[ChatControl alloc]init];
    vc1.title = @"聊天";
    vc1.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    DynamicControl *vc2 = [[DynamicControl alloc]init];
    vc2.title = @"朋友";
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    FriendControl *vc3 = [[FriendControl alloc]init];
    vc3.title = @"动态";
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    self.viewControllers = @[nav1,nav2,nav3];
    [self creatTabBarView];;
}

#pragma mark - 创建TabBarView

- (void)creatTabBarView {
    self.tabBar.hidden = YES;
    _tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - tabBarHeight, CGRectGetWidth(self.view.bounds), tabBarHeight)];
    _rect = _tabBarView.frame;
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarView];
    
    [self creatButtonItem:@[@"聊天",@"朋友",@"动态"]
               imageArray:@[@"tabbar_info",@"tabbar_client",@"tabbar_more"] imageSelectArray:@[@"tabbar_info_selected",@"tabbar_client_selected",@"tabbar_more_selected"]];
}

- (void)creatButtonItem:(NSArray *)array imageArray:(NSArray *)imageArray imageSelectArray:(NSArray *)imageSelectArray{

    CGFloat buttonW = CGRectGetWidth(self.view.bounds)/array.count;
    CGFloat buttonH = CGRectGetHeight(_tabBarView.bounds);
    
    for (int i = 0 ; i < array.count; i ++) {
        WJTabBarButton *customButton = [WJTabBarButton buttonWithType:UIButtonTypeCustom];
        customButton.tag = i;
        [customButton setTitle:array[i] forState:UIControlStateNormal];
        [customButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [customButton setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [customButton setImage:[UIImage imageNamed:imageSelectArray[i]] forState:UIControlStateSelected];
        [customButton addTarget:self action:@selector(customButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        customButton.titleLabel.font = [UIFont systemFontOfSize:10];
        customButton.frame = CGRectMake(buttonW *i, 0, buttonW, buttonH);
        [_tabBarView addSubview:customButton];
        
        if(i == 0)//设置第一个选择项。（默认选择项）
        {
            _oldButton = customButton;
            _oldButton.selected = YES;
        }
    }
}

#pragma mark - 点击事件

- (void)customButtonPressed:(WJTabBarButton *)sender {
    if(self.selectedIndex != sender.tag){ //wsq®
        self.selectedIndex = sender.tag; //切换不同控制器的界面
        _oldButton.selected = ! _oldButton.selected;
        _oldButton = sender;
        _oldButton.selected = YES;
    }
}

#pragma mark - 弹出消失动画

- (void)showTabBar {
    [UIView animateWithDuration:0.2 animations:^{
          _tabBarView.frame = _rect;
    }];
}

- (void)hidTabBar {
    [UIView animateWithDuration:0.2 animations:^{
        _tabBarView.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds), CGRectGetWidth(self.view.bounds), tabBarHeight);
    }];
  
}

@end
