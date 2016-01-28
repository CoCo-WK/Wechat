//
//  AppDelegate.m
//  微信1-09
//
//  Created by dc004 on 16/1/9.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"
#import "EnterViewController.h"
//#import "ViewController.h"
//#import "TwoViewController.h"
//#import "ThreeViewController.h"
//#import "FourViewController.h"
@interface AppDelegate ()
//{
//    ViewController *OneViewCon;
//    TwoViewController *twoViewCon;
//    ThreeViewController *threeViewCon;
//    FourViewController *fourViewCon;
//   
//}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:1];
    NSArray *array = [NSArray arrayWithContentsOfFile:@"/Users/dc004/Desktop/message.plist"];
    if ([array[0][1][1]isEqualToString:@""])
    {
        EnterViewController *enterViewCon = [[EnterViewController alloc]init];
        self.window.rootViewController = enterViewCon;
       
    }
    else{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.tintColor = [UIColor blackColor];
    self.window.backgroundColor = [UIColor whiteColor];
    TabbarViewController *tabber = [[TabbarViewController alloc]init];
    tabber.tabBar.tintColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];

    self.window.rootViewController = tabber;
    }
//    OneViewCon = [[ViewController alloc]init];
//    twoViewCon = [[TwoViewController alloc]init];
//    threeViewCon = [[ThreeViewController alloc]init];
//    fourViewCon = [[FourViewController alloc]init];
//    UINavigationController *oneNavi = [[UINavigationController alloc]initWithRootViewController:OneViewCon];
//    UINavigationController *twoNavi = [[UINavigationController alloc]initWithRootViewController:twoViewCon];
//    UINavigationController *threeNavi = [[UINavigationController alloc]initWithRootViewController:threeViewCon];
//    UINavigationController *fourNavi = [[UINavigationController alloc]initWithRootViewController:fourViewCon];
//    OneViewCon.tabBarItem.title=@"微信";
//    OneViewCon.tabBarItem.image=[UIImage imageNamed:@"微信"];
//    OneViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"微信1"];
//    twoViewCon.tabBarItem.title=@"通讯录";
//    twoViewCon.tabBarItem.image=[UIImage imageNamed:@"通讯录"];
//    twoViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"通讯录1"];
//    threeViewCon.tabBarItem.title=@"发现";
//    threeViewCon.tabBarItem.image=[UIImage imageNamed:@"发现"];
//    threeViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"发现1"];
//    fourViewCon.tabBarItem.title = @"我";
//    fourViewCon.tabBarItem.image = [UIImage imageNamed:@"我"];
//    fourViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"我1"];

    
//    tabber.viewControllers = @[oneNavi,twoNavi,threeNavi,fourNavi];
//    tabber.tabBar.tintColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
           return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
