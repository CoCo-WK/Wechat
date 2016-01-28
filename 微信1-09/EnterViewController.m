//
//  EnterViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/15.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "EnterViewController.h"
#import "RegisterViewController.h"
#import "TabbarViewController.h"

@interface EnterViewController ()
{
    NSArray *_array;
}
@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    _array = [NSArray arrayWithContentsOfFile:path];
    [self layout];
}
-(void)layout{
    _accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 50, 30)];
    _accountLabel.text = @"账号";
    
    _passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 185, 50, 30)];
    _passwordLabel.text = @"密码";
    
    _accountText = [[UITextField alloc]initWithFrame:CGRectMake(55, 120, 280, 30)];
    _accountText.borderStyle = UITextBorderStyleNone;
     _accountText.placeholder = @"第一位必须是字母，6-16位";
   // _accountText.backgroundColor = [UIColor redColor];
    
    _passwordText = [[UITextField alloc]initWithFrame:CGRectMake(55, 185, 280, 30)];
    _passwordText.borderStyle = UITextBorderStyleNone;
    _passwordText.placeholder = @"请填写密码";
    _passwordText.secureTextEntry = YES;
   // _passwordText.backgroundColor = [UIColor redColor];
    
    View *myView1 = [[View alloc]initWithFrame:CGRectMake(55, 145, 280, 2)];;
    myView1.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.2 alpha:1];
    
    [self.view addSubview:myView1];
    
    View *myView2 = [[View alloc]initWithFrame:CGRectMake(55, 215, 280, 2)];;
    myView2.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.2 alpha:1];
    
    [self.view addSubview:myView2];
    
    
    
    
    
    
    _enterButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 250, 315, 40)];
    _enterButton.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
    [_enterButton setTitle:@"登录" forState:UIControlStateNormal];
    [_enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _enterButton.layer.cornerRadius = 7;
    [_enterButton addTarget:self action:@selector(enterButt) forControlEvents:UIControlEventTouchUpInside];
    _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 310, 315, 40)];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    _registerButton.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerButton.layer.cornerRadius = 7;
    [_registerButton addTarget:self action:@selector(registerButt) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_accountLabel];
    [self.view addSubview:_passwordLabel];
    [self.view addSubview:_accountText];
    [self.view addSubview:_passwordText];
    [self.view addSubview:_enterButton];
    [self.view addSubview:_registerButton];
}
-(void)enterButt{
    NSString *regex1 = @"^[A-Za-z]\\w{5,15}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex1];

    if ([predicate evaluateWithObject: _accountText.text]==1 && [_accountText.text isEqualToString:_array[0][1][1]]) {
        if ([predicate evaluateWithObject:_passwordText.text]==1) {
            NSArray *arr = @[@1];
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setValue: arr[0] forKey:@"user"];
            TabbarViewController *backView= [[TabbarViewController alloc]init];
            [self presentViewController:backView animated:NO completion:nil];
        }
    }
    else{
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"登陆错误" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:actionSheet animated:YES completion:nil];

    }
  
}
-(void)registerButt{
    RegisterViewController *registerViewCon = [[RegisterViewController alloc]init];
    [self presentViewController:registerViewCon animated:NO completion:nil];
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
