//
//  CardViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/14.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()
{
    UIScrollView *scrollView;
    UIView *view;
    UILabel *labelText;
    UIImageView *imageView;
}

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
    
    
}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(168,10 ,140 , 30)];
    label.text = @"卡包";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 12, 100, 20);
    [backButton setTitle:@"我" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view addSubview:label];
    [view addSubview:backButton];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, 375, 602)];
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(375,605);
    scrollView.showsVerticalScrollIndicator = NO;
    labelText = [[UILabel alloc]initWithFrame:CGRectMake(10, 260, 355, 30)];
    labelText.textAlignment = NSTextAlignmentCenter;
    labelText.text = @"努力开发中,敬请期待!";
    labelText.textColor = [UIColor grayColor];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(147.5, 80, 80, 80)];
    imageView.image = [UIImage imageNamed:@"卡包11"];
    [self.view addSubview:scrollView];
    [scrollView addSubview:labelText];
    [scrollView addSubview:imageView];
    
    
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
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
