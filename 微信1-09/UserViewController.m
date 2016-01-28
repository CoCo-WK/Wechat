//
//  UserViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/11.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "UserViewController.h"
#import "UserTableViewCell.h"
#import "NameViewController.h"
#import "AccountViewController.h"
#import "SignViewController.h"
#import "SexViewController.h"
#import "AddressViewController.h"
#import "AreaViewController.h"
#import "LinkedlnViewController.h"
#import "TabbarViewController.h"
@interface UserViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    NSArray *_userArr;
    NSArray *_messageArray;
    UIImagePickerController *_imagePickerController;
    
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NameViewController *nameViewCon = [[NameViewController alloc]init];
    AccountViewController *accountViewCon = [[AccountViewController alloc]init];
    AddressViewController *addressViewCon = [[AddressViewController alloc]init];
    SignViewController *signViewCon = [[SignViewController alloc]init];
    SexViewController *sexViewCon = [[SexViewController alloc]init];
    AreaViewController *areaViewCon = [[AreaViewController alloc]init];
    LinkedlnViewController *linkedin = [[LinkedlnViewController alloc]init];
    _messageArray = @[@[nameViewCon,accountViewCon,nameViewCon,addressViewCon],@[sexViewCon,areaViewCon,signViewCon],@[linkedin]];
    _userArr = @[@"胡歌",@"userName"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];

    _array = [NSArray arrayWithContentsOfFile:path];
    [self layout];
}
-(void)layout{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 375, 667)style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return [_array[section-1] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_array count]+1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UserTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.imageview.frame = CGRectMake(275, 13, 55, 55);
        cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_userArr[indexPath.row]]];
        cell.label.font = [UIFont fontWithName:@"Arial" size:21];
        cell.label.frame = CGRectMake(30, 15, 50, 50);
        cell.label.text = @"头像";
        cell.rightButton.frame = CGRectMake(345, 25, 30, 30);
       
    }
    else{

        cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_array[indexPath.section-1][indexPath.row][0]]];
        cell.label.text = _array[indexPath.section-1][indexPath.row][0];
        cell.messageLabel.text = _array[indexPath.section-1][indexPath.row][1];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(156,10 ,80 , 30)];
    label.text = @"个人信息";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:20];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 10, 50, 30);
    [backButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton setTitle:@"我" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view addSubview:label];
    [view addSubview:backButton];
    if (section == 1) {
        return 10;
    }
    if (section == 2) {
        return 15;
    }
    if (section == 3) {
        return 15;
    }
    return 55;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
    return 35;
}
-(void)back{
   
    NSArray *arr = @[@1];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue: arr[0] forKey:@"user"];
    TabbarViewController *backView= [[TabbarViewController alloc]init];
    [self presentViewController:backView animated:NO completion:nil];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"拍照");
        }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _imagePickerController = [[UIImagePickerController alloc]init];
           [self presentViewController:_imagePickerController animated:YES completion:nil];
        
        
        
        }]];
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消");
        }]];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }else{
        [self presentViewController:_messageArray[indexPath.section-1][indexPath.row] animated:YES completion:nil];
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
