//
//  AreaViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/14.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "AreaViewController.h"
#import "UserViewController.h"
#import "AreaAddressView.h"
@interface AreaViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIView *view;
    UILabel *titleLabel;
    UITextField *textField;
    NSMutableArray *array;
    
}
@property(nonatomic,strong)AreaAddressView *areaAddressView;
@property(nonatomic,strong)UIToolbar *toolBar;
@end

@implementation AreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];
    self.areaAddressView = [[AreaAddressView alloc] init];
    textField.inputView = self.areaAddressView;
    textField.inputAccessoryView = self.toolBar;
     textField.text = array[1][1][1];
}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(175,10 ,100 , 30)];
    label.text = @"地区";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 10, 80, 30);
    [backButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
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
    textField = [[UITextField alloc]initWithFrame:CGRectMake(55, 15, 335, 30)];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 0.3;
    textField.layer.cornerRadius = 7;
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 60, 30)];
    titleLabel.text = @"地区";
    UIView *leftWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    leftWhite.backgroundColor = [UIColor whiteColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftWhite;
    textField.placeholder = @"请点击选择地区";
    [self.view addSubview:scrollView];
    [scrollView addSubview:textField];
    [scrollView addSubview:titleLabel];
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)preserve{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[1][1][1] = textField.text;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
    [self presentViewController:userViewCon animated:NO completion:nil];
    
}
- (UIToolbar *)toolBar{
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _toolBar.barTintColor=[UIColor brownColor];
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
        _toolBar.items = @[item1, item2];
    }
    return _toolBar;
}

- (void)click{
    if (textField.isFirstResponder) {
        [textField resignFirstResponder];
        textField.text = [NSString stringWithFormat:@"%@%@%@",self.areaAddressView.province,self.areaAddressView.city,self.areaAddressView.area];
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
