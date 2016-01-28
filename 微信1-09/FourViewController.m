//
//  FourViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/9.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "FourViewController.h"
#import "FourthTableViewCell.h"
#import "UserViewController.h"
#import "CardViewController.h"
#import "SettingViewController.h"
#import "TabbarViewController.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    NSArray *_userArr;
    NSArray *_jumpArray;
    UIImagePickerController *_imagePickerController;
    
}
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];  
    CardViewController *cardViewCon = [[CardViewController alloc]init];
    SettingViewController *settingViewCon = [[SettingViewController alloc]init];
    _imagePickerController = [[UIImagePickerController alloc]init];
    _userArr = @[@"胡歌",@"userName"];
    _array = @[@[@"相册",@"收藏",@"钱包",@"卡包"],@[@"表情"],@[@"设置"]];
    _jumpArray = @[@[_imagePickerController,cardViewCon,cardViewCon,cardViewCon],@[cardViewCon],@[settingViewCon]];
    [self layout];
}
-(void)layout{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)style:UITableViewStyleGrouped];
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
    FourthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[FourthTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.imageview.frame = CGRectMake(5, 13, 50, 50);
        cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_userArr[indexPath.row]]];
        cell.label.font = [UIFont fontWithName:@"Arial" size:21];
        cell.label.frame = CGRectMake(70, 15, 50, 50);
        cell.label.text = _userArr[indexPath.row];
        cell.rightButton.frame = CGRectMake(345, 25, 30, 30);

    }
    else{
    cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_array[indexPath.section-1][indexPath.row]]];
    cell.label.text = _array[indexPath.section-1][indexPath.row];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
        return 35;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    if (indexPath.section == 0) {
        [self presentViewController:userViewCon animated:YES completion:nil];
    }else {
        [self presentViewController:_jumpArray[indexPath.section-1][indexPath.row] animated:NO completion:nil];
        
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
