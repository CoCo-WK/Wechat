//
//  AddressViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/13.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "AddressViewController.h"
#import "UserViewController.h"
@interface AddressViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIView *view;
    UILabel *titleLabel;
    UITextField *textField;
    NSMutableArray *array;
    NSMutableArray *arrayField;
    NSArray *arrayName;
    NSArray *wordArray;
}

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayName = @[@"收货人",@"手机号码",@"选择地区",@"详细地址",@"邮政编码"];
    wordArray = @[@"名字",@"11位手机号",@"地区信息",@"街道门牌信息",@"邮政编码"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];

}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(148,10 ,100 , 30)];
    label.text = @"修改地址";
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
    [self.view addSubview:scrollView];
    arrayField = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 0; i < [arrayName count]; i++) {
        textField = [[UITextField alloc]initWithFrame:CGRectMake(80,15+i*50, 335, 30)];
        textField.placeholder = wordArray[i];
        textField.font = [UIFont fontWithName:@"Arial" size:15];
        textField.layer.borderColor = [UIColor grayColor].CGColor;
        textField.layer.borderWidth = 0.3;
        textField.layer.cornerRadius = 7;
        textField.text = array[i];
        
        UIView *leftWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
        leftWhite.backgroundColor = [UIColor whiteColor];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = leftWhite;
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15+i*50, 60, 30)];
        titleLabel.text = arrayName[i];
        titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
        [scrollView addSubview:textField];
        [scrollView addSubview:titleLabel];
        [arrayField addObject:textField];
    }
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)preserve{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    for (int i = 0; i<[arrayField count]; i++) {
        array[i] = ((UITextField *)arrayField[i]).text;
         NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        [array writeToFile:path atomically:YES];
    }
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
