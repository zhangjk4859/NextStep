//
//  ViewController.m
//  block强弱引用
//
//  Created by kevin on 2017/7/6.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestObject *obj = [TestObject new];//在创建的时候设定好要执行的动作，
    obj.block();//一秒后打印下obj
    
    
    //1秒后还在不在，此时，obj已经被释放
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
