//
//  SettingViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/15.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "EnterViewController.h"
#import "CardViewController.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
    NSMutableArray *_accountArray;
     UIView *view;
    NSArray *jumpArray;

}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    CardViewController *cardViewCon = [[CardViewController alloc]init];
    _array = @[@[@"账号与安全"],@[@"新消息通知",@"隐私",@"通用"],@[@"帮助与反馈",@"关于微信"],@[@"退出登录"]];
    jumpArray = @[@[cardViewCon],@[cardViewCon,cardViewCon,cardViewCon],@[cardViewCon,cardViewCon],@[@"退出登录"]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    
    _accountArray = [NSMutableArray arrayWithContentsOfFile:path];
    [self layout];
}
-(void)layout{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 17, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(168,5 ,140 , 30)];
    label.text = @"设置";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(-20, 9, 100, 20);
    [backButton setTitle:@"我" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view addSubview:label];
    [view addSubview:backButton];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 48, 375, 667)style:UITableViewStyleGrouped];
//    _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return [_array[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_array count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 3) {
        cell.label.text = _array[indexPath.section][indexPath.row];
        cell.label.textAlignment = NSTextAlignmentCenter;
        cell.label.font = [UIFont fontWithName:@"Arial" size:17];
    }else{
    cell.label.text = _array[indexPath.section][indexPath.row];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 40;
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EnterViewController *enterViewCon = [[EnterViewController alloc]init];
    if (indexPath.section == 3) {
        _accountArray[0][1][1] = @"";
        NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
        [_accountArray writeToFile:path atomically:YES];
        [self presentViewController:enterViewCon animated:NO completion:nil];
    }
    else{
        [self presentViewController:jumpArray[indexPath.section][indexPath.row] animated:NO completion:nil];
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
