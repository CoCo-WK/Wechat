//
//  RegisterViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/15.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "RegisterViewController.h"
#import "EnterViewController.h"
@interface RegisterViewController ()
{
    NSMutableArray *_array;
    NSMutableArray *_passwordArray;
    NSString *path;
    NSString *path1;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _array = [NSMutableArray array];
    _passwordArray = [NSMutableArray array];
    path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];

    _array = [NSMutableArray arrayWithContentsOfFile:path];
    path1 = [[NSBundle mainBundle] pathForResource:@"password" ofType:@"plist"];

    _passwordArray = [NSMutableArray arrayWithContentsOfFile:path1];
    [self layout];
}
-(void)layout{
    _back = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 50, 30)];
    _back.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
    _back.layer.cornerRadius = 5;
    [_back setTitle:@"返回" forState:UIControlStateNormal];
    [_back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_back addTarget:self action:@selector(backButt) forControlEvents:UIControlEventTouchUpInside];
    
    _accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 50, 30)];
    _accountLabel.text = @"账号";
    _passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 185, 50, 30)];
    _passwordLabel.text = @"密码";
    _accountText = [[UITextField alloc]initWithFrame:CGRectMake(55, 120, 280, 30)];
    _accountText.placeholder = @"请填写账号";
//    _accountText.backgroundColor = [UIColor redColor];
    _passwordText = [[UITextField alloc]initWithFrame:CGRectMake(55, 185, 280, 30)];
    _passwordText.placeholder = @"请填写密码";
//    _passwordText.backgroundColor = [UIColor redColor];
    _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 290, 115, 40)];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    _registerButton.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerButton.layer.cornerRadius = 7;
    [_registerButton addTarget:self action:@selector(registerButt) forControlEvents:UIControlEventTouchUpInside];
    View *myView1 = [[View alloc]initWithFrame:CGRectMake(55, 145, 280, 2)];;
    myView1.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.2 alpha:1];
    
    [self.view addSubview:myView1];
    
    View *myView2 = [[View alloc]initWithFrame:CGRectMake(55, 215, 280, 2)];;
    myView2.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.2 alpha:1];
    
    [self.view addSubview:myView2];
    [self.view addSubview:_back];
    [self.view addSubview:_accountLabel];
    [self.view addSubview:_passwordLabel];
    [self.view addSubview:_accountText];
    [self.view addSubview:_passwordText];
    [self.view addSubview:_registerButton];
}

-(void)backButt{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)registerButt{
    EnterViewController *enterViewCon = [[EnterViewController alloc]init];
    NSString *regex1 = @"^[A-Za-z]\\w{5,15}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex1];
    if ([predicate evaluateWithObject: _accountText.text]==1 && ![_accountText.text isEqualToString:_array[0][1][1]]) {
        if ([predicate evaluateWithObject:_passwordText.text]==1) {
            
            _array[0][1][1] = _accountText.text;
            _passwordArray[0] = _passwordText.text;
            
            [_array writeToFile:path atomically:YES];
            [_passwordArray writeToFile:path1 atomically:YES];
            
            [self presentViewController:enterViewCon animated:NO completion:nil];
        }
        else{
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"格式错误" message:@"账号或密码不符" preferredStyle:UIAlertControllerStyleAlert];
            [actionSheet addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:actionSheet animated:YES completion:nil];
            
        }

    }
    else{
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"格式错误" message:@"账号或密码不符" preferredStyle:UIAlertControllerStyleAlert];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:actionSheet animated:YES completion:nil];
        
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
