//
//  AppDelegate.m
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "AxelDoc.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property(nonatomic,strong)MasterViewController *masterViewController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 创建viewController
    self.masterViewController = [[MasterViewController alloc] initWithNibName:NSStringFromClass([MasterViewController class]) bundle:nil];
    
    //加载数据
    AxelDoc * bug1 = [[AxelDoc alloc] initWithTitle:@"Potato Bug" rating:4 thumbImage:[NSImage imageNamed:@"potatoBugThumb"] fullImage:[NSImage imageNamed:@"potatoBug"]];
    
    AxelDoc * bug2 = [[AxelDoc alloc] initWithTitle:@"House Centipede" rating:3 thumbImage:[NSImage imageNamed:@"centipedeThumb"] fullImage:[NSImage imageNamed:@"centipede"]];
    
    AxelDoc * bug3 = [[AxelDoc alloc] initWithTitle:@"Wolf Spider" rating:5 thumbImage:[NSImage imageNamed:@"wolfSpiderThumb"] fullImage:[NSImage imageNamed:@"wolfSpider"]];
    
    AxelDoc * bug4 = [[AxelDoc alloc] initWithTitle:@"Lady Bug" rating:1 thumbImage:[NSImage imageNamed:@"ladybugThumb"] fullImage:[NSImage imageNamed:@"ladybugThumb"]];
    NSMutableArray *bugs = [NSMutableArray arrayWithObjects:bug1,bug2,bug3,bug4,nil];
    
    self.masterViewController.bugs = bugs;
    //view添加到window的contentView上
    [self.window.contentView addSubview:self.masterViewController.view];
    //设置窗口的大小
    self.window.contentView.frame = CGRectMake(0, 0, 1000, 500);
    //设置视图和窗口大小相同
    self.masterViewController.view.frame = self.window.contentView.bounds;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
