//
//  AppDelegate+LocalNotification.m
//  APNSTest
//
//  Created by LeeWong on 2016/12/2.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

#import "AppDelegate+LocalNotification.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

/*
 {
 "aps":{
 "alert" : {
 "title" : "iOS远程消息，我是主标题！-title",
 "subtitle" : "iOS远程消息，我是主标题！-Subtitle",
 "body" : "Dely,why am i so handsome -body"
 },
 "sound" : "default",
 "badge" : "1",
 "mutable-content" : "1",
 "category" : "Dely_category"
 },
 "image" : "https://p1.bpimg.com/524586/475bc82ff016054ds.jpg",
 "type" : "scene",
 "id" : "1007"
 }

 */

@implementation AppDelegate (LocalNotification)

+ (void)createAudioNotification {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"爱奇艺阅读";
    content.subtitle = @"所有的向往";
    content.body = @"阅读类APP";
    
    UNNotificationSound *sound = [UNNotificationSound defaultSound];
    content.sound = sound;
    content.badge = @1;
    
    [AppDelegate addNotificationAction];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requestIdentifier = @"request";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

+ (void)createImageNotification {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"爱奇艺阅读";
    content.subtitle = @"所有的向往";
    content.body = @"阅读类APP";
    
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"scanqrcode" ofType:@"gif"];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    
    if (imagePath.length > 0) {
        NSError *error = nil;
        UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"imageattachment" URL:[NSURL fileURLWithPath:imagePath] options:nil error:&error];
        if (attachment) {
            content.attachments = @[attachment];
        }
    }
    
    [AppDelegate addNotificationAction];

    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requestIdentifier = @"request";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}


+ (void)createVideoNotification {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"爱奇艺阅读";
    content.subtitle = @"所有的向往";
    content.body = @"阅读类APP";
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"moments" ofType:@"mp4"];
    
    if (videoPath.length > 0) {
        NSError *error = nil;
        UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"videoattachment" URL:[NSURL fileURLWithPath:videoPath] options:nil error:&error];
        if (attachment) {
            content.attachments = @[attachment];
        }
    }
    
    [AppDelegate addNotificationAction];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requestIdentifier = @"request";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}


@end
