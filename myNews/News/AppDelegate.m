//
//  AppDelegate.m
//  News
//
//  Created by Kwangchiu on 2019/6/11.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "AppDelegate.h"
#import "page0VC.h"
#import "page1VC.h"
#import "page2VC.h"
#import "page3TVC.h"
#import "page4VC.h"
#import "page5VC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //************************tabbar定义***************
    
    page0VC * page0 = [[page0VC alloc]initWithNibName:@"news" bundle:nil];
    UINavigationController * page0NC = [[UINavigationController alloc]initWithRootViewController:page0];
    page0.title = @"新闻";
    
    page1VC * page1 = [[page1VC alloc]initWithNibName:@"video" bundle:nil];
//    page1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    UINavigationController * page1NC = [[UINavigationController alloc]initWithRootViewController:page1];
    page1.title = @"视频";
    
    page2VC * page2 = [[page2VC alloc]initWithNibName:@"mine" bundle:nil];
//    page2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    UINavigationController * page2NC = [[UINavigationController alloc]initWithRootViewController:page2];
    page2.title = @"我的";
    
    //********************************
    
    UITabBarController * main = [[UITabBarController alloc] init];
    main.viewControllers = @[page0NC,page1NC,page2NC];
    self.window.rootViewController = main;
    
    
    
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
