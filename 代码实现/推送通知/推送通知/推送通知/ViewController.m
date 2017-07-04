//
//  ViewController.m
//  推送通知
//
//  Created by 张俊凯 on 2017/1/12.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取当前通知中心
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    // 设置代理
    center.delegate = self;
    
    // 申请权限
    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionCarPlay
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                          }];
    /*
       iOS 8 ----- 10
     */
    // 设置允许展示的内容（角标、声音、窗口）
    UIUserNotificationType userNotiType =
    UIUserNotificationTypeBadge |
    UIUserNotificationTypeSound |
    UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:userNotiType categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    //iOS7
    UIRemoteNotificationType remoteNotiType =
    UIRemoteNotificationTypeBadge |
    UIRemoteNotificationTypeAlert |
    UIRemoteNotificationTypeSound;
    
    

}

//创建和发送通知
-(void)creatAndSendNote{
    
    //iOS10
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.body = @"notification";
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = @{@"index" : @(1)};
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"notification1" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    //iOS 10以下
    UILocalNotification *localNoti = [[UILocalNotification alloc] init];
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    localNoti.timeZone = [NSTimeZone defaultTimeZone];
    localNoti.soundName = UILocalNotificationDefaultSoundName;
    localNoti.alertBody = @"notification";
    localNoti.userInfo = @{@"index" : @(1)};
    // 将当前本地通知加入计划当中，到fireDate设置的时间会进行推送
    [[UIApplication sharedApplication] scheduleLocalNotification:localNoti];
    // 立刻推送当前的本地通知，不管fireDate的设置如何
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNoti];
}

//展示和处理
 //后台
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    // must be called
    completionHandler();
    
    
}


//在该回调中处理。iOS 10
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
};

//iOS10以下
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
};

//撤销操作
-(void)cancel
{
    // 获取计划中的推送
    [[UNUserNotificationCenter currentNotificationCenter] getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
    }];
    // 撤销计划中的指定identifier的推送
    [[UNUserNotificationCenter currentNotificationCenter]removePendingNotificationRequestsWithIdentifiers:@"notification1"];
    // 撤销全部计划中的推送
    [[UNUserNotificationCenter currentNotificationCenter] removeAllPendingNotificationRequests];
    
    // 获取已发送的推送
    [[UNUserNotificationCenter currentNotificationCenter] getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
    }];
    // 撤销已发送的指定identifier的推送
    [[UNUserNotificationCenter currentNotificationCenter] removeDeliveredNotificationsWithIdentifiers:@"notification1"];
    // 撤销全部已发送的推送
    [[UNUserNotificationCenter currentNotificationCenter] removeAllDeliveredNotifications];
}


@end
