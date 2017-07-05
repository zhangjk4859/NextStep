//
//  ViewController.m
//  画气泡
//
//  Created by kevin on 2017/7/4.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "BasicView.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)loadView{
    self.view = [[BasicView alloc] init];
    self.view.backgroundColor = [UIColor grayColor];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PopView *pop = [[PopView alloc] init];
    [self.view addSubview:pop];//添加子视图，会调用两次 layout subview,然后调用drawRect
    pop.frame = CGRectMake(100, 200, 100, 100);//添加子视图，子视图设置了frame，会调用layout subviews  先布局好，再画
    pop.backgroundColor = [UIColor redColor];
    
    /*
    //视图滚动后需要布局，屏幕旋转需要布局，改变子视图大小也需要重新布局
    [self.view setNeedsLayout];//只设置布局参数，不布局
    [self.view layoutIfNeeded];//布局动作发生两次
    [self.view layoutSubviews];//布局动作发生
     */
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.view setNeedsDisplay];
}



//总结，layout布局好了就开始画，直接调用也开始画

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
