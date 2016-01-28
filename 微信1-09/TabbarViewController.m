//
//  TabbarViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/15.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "TabbarViewController.h"
#import "WeChantViewController.h"
#import "ContactsViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "NaviViewController.h"
@interface TabbarViewController ()
{
    WeChantViewController *OneViewCon;
    ContactsViewController *twoViewCon;
    ThreeViewController *threeViewCon;
    FourViewController *fourViewCon;
     NSNumber *tag;
}

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    OneViewCon = [[WeChantViewController alloc]init];
    twoViewCon = [[ContactsViewController alloc]init];
    threeViewCon = [[ThreeViewController alloc]init];
    fourViewCon = [[FourViewController alloc]init];
    
    NaviViewController *oneNavi = [[NaviViewController alloc]initWithRootViewController:OneViewCon];
    oneNavi.navigationBar.barStyle = UIBarStyleDefault;
    oneNavi.navigationBar.barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    oneNavi.navigationBar.tintColor = [UIColor whiteColor];
    
    UINavigationController *twoNavi = [[UINavigationController alloc]initWithRootViewController:twoViewCon];
    twoNavi.navigationBar.barStyle = UIBarStyleDefault;
    twoNavi.navigationBar.barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    twoNavi.navigationBar.tintColor = [UIColor whiteColor];
    
    NaviViewController *threeNavi = [[NaviViewController alloc]initWithRootViewController:threeViewCon];
    threeNavi.navigationBar.barStyle = UIBarStyleDefault;
    threeNavi.navigationBar.barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    threeNavi.navigationBar.tintColor = [UIColor whiteColor];

    NaviViewController *fourNavi = [[NaviViewController alloc]initWithRootViewController:fourViewCon];
    fourNavi.navigationBar.barStyle = UIBarStyleDefault;
    fourNavi.navigationBar.barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    fourNavi.navigationBar.tintColor = [UIColor whiteColor];

    
    OneViewCon.tabBarItem.title=@"微信";
    OneViewCon.tabBarItem.image=[UIImage imageNamed:@"微信"];
    OneViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"微信1"];
    twoViewCon.tabBarItem.title=@"通讯录";
    twoViewCon.tabBarItem.image=[UIImage imageNamed:@"通讯录"];
    twoViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"通讯录1"];
    threeViewCon.tabBarItem.title=@"发现";
    threeViewCon.tabBarItem.image=[UIImage imageNamed:@"发现"];
    threeViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"发现1"];
    fourViewCon.tabBarItem.title = @"我";
    fourViewCon.tabBarItem.image = [UIImage imageNamed:@"我"];
    fourViewCon.tabBarItem.selectedImage = [UIImage imageNamed:@"我1"];
    
    self.viewControllers = @[oneNavi,twoNavi,threeNavi,fourNavi];
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    tag = [userDe valueForKey:@"user"];
    NSArray *arr = @[@1,@2,@3,@4];
    if(tag == arr[0]){
        self.selectedViewController = oneNavi;
    }if (tag == arr[3]) {
        self.selectedViewController = fourNavi;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
