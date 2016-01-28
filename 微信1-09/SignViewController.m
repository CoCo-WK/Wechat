//
//  SignViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/12.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "SignViewController.h"
#import "UserViewController.h"
@interface SignViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIView *view;
    UITextField *textField;
    NSMutableArray *array;
    
}

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];
    textField.text = array[1][2][1];
}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(148,10 ,100 , 30)];
    label.text = @"个性签名";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 12, 100, 20);
    [backButton setTitle:@"个人信息" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeSystem];
    finishButton.frame = CGRectMake(320, 10, 50, 30);
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishButton addTarget:self action:@selector(preserve) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view addSubview:label];
    [view addSubview:backButton];
    [view addSubview:finishButton];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, 375, 602)];
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(375,605);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, 375, 70)];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 0.3;
    UIView *leftWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    leftWhite.backgroundColor = [UIColor whiteColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftWhite;

    [self.view addSubview:scrollView];
    [scrollView addSubview:textField];
    
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)preserve{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[1][2][1] = textField.text;
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
