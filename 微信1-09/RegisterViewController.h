//
//  RegisterViewController.h
//  微信1-09
//
//  Created by dc004 on 16/1/15.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
@interface RegisterViewController : UIViewController
@property(nonatomic,strong)UILabel *accountLabel;
@property(nonatomic,strong)UILabel *passwordLabel;
@property(nonatomic,strong)UITextField *accountText;
@property(nonatomic,strong)UITextField *passwordText;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic,strong)UIButton *back;
@end
