//
//  SexViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/13.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "SexViewController.h"
#import "UserViewController.h"
@interface SexViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIView *view;
    UIButton *manButton;
    UIButton *womanButton;
    NSMutableArray *array;
    
}

@end

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];

}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(155,10 ,100 , 30)];
    label.text = @"性别";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 12, 100, 20);
    [backButton setTitle:@"个人信息" forState:UIControlStateNormal];
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
    scrollView.delegate = self;
    manButton = [UIButton buttonWithType:UIButtonTypeSystem];
    manButton.frame = CGRectMake(0, 15, 375, 30);
    [manButton setTitle:@"男" forState:UIControlStateNormal];
    [manButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    manButton.layer.borderColor = [UIColor blackColor].CGColor;
    manButton.layer.borderWidth = 0.3;
    [manButton addTarget:self action:@selector(man) forControlEvents:UIControlEventTouchUpInside];
    womanButton = [UIButton buttonWithType:UIButtonTypeSystem];
    womanButton.frame = CGRectMake(0, 45, 375, 30);
    [womanButton setTitle:@"女" forState:UIControlStateNormal];
    [womanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    womanButton.layer.borderColor = [UIColor blackColor].CGColor;
    womanButton.layer.borderWidth = 0.3;
    [womanButton addTarget:self action:@selector(woman) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:scrollView];
    [scrollView addSubview:manButton];
    [scrollView addSubview:womanButton];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)man{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[1][0][1] = @"男";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
    [self presentViewController:userViewCon animated:NO completion:nil];
    
}
-(void)woman{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[1][0][1] = @"女";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
    [self presentViewController:userViewCon animated:NO completion:nil];

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
