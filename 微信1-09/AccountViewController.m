//
//  AccountViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/12.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "AccountViewController.h"
#import "UserViewController.h"
@interface AccountViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIView *view;
    UIImageView *imageView;
    UILabel *nameLabel;
    UILabel *titleLabel;
    UITextField *textField;
    NSMutableArray *array;

}
@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];
    textField.text = array[0][1][1];
}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(148,10 ,100 , 30)];
    label.text = @"设置微信号";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 10, 50, 30);
    [backButton setTitle:@"取消" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIButton *preserveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    preserveButton.frame = CGRectMake(320, 10, 50, 30);
    [preserveButton setTitle:@"保存" forState:UIControlStateNormal];
    [preserveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [preserveButton addTarget:self action:@selector(preserve) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view addSubview:label];
    [view addSubview:backButton];
    [view addSubview:preserveButton];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, 375, 602)];
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(375,605);
    scrollView.bounces = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    imageView.image = [UIImage imageNamed:@"胡歌"];
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 15, 40, 30)];
    nameLabel.text = @"胡歌";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    textField = [[UITextField alloc]initWithFrame:CGRectMake(65, 80, 335, 30)];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 0.3;
    textField.layer.cornerRadius = 7;
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 60, 30)];
    titleLabel.text = @"微信号";
    UIView *leftWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    leftWhite.backgroundColor = [UIColor whiteColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftWhite;

    [self.view addSubview:scrollView];
    [scrollView addSubview:imageView];
    [scrollView addSubview:nameLabel];
    [scrollView addSubview:textField];
    [scrollView addSubview:titleLabel];
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)preserve{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[0][1][1] = textField.text;
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
