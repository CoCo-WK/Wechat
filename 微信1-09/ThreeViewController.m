//
//  ThreeViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/9.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThirdTableViewCell.h"
#import "CricleFriend.h"
#import "shakeView.h"
#import "GameHome.h"
#import "ShoppingView.h"
#import "nearbyView.h"
#import "DriftingView.h"
#import "SweepView.h"
@interface ThreeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_contentArray;
    NSArray *jumpArray;
    
    
    CricleFriend *friend;
    shakeView *shake;
    GameHome *gamehome;
    ShoppingView *shop;
    nearbyView *near;
    DriftingView *drift;
    SweepView *sweep;

}

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    friend = [[CricleFriend alloc]init];
    shake = [[shakeView alloc]init];
    gamehome = [[GameHome alloc]init];
    shop = [[ShoppingView alloc]init];
    near = [[nearbyView alloc]init];
    drift = [[DriftingView alloc]init];
    sweep = [[SweepView alloc]init];
    self.title =@"发现";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    _contentArray = @[@[@"朋友圈"],@[@"扫一扫1",@"摇一摇"],@[@"附近的人",@"漂流瓶"],@[@"购物",@"游戏"]];
    jumpArray = @[@[friend],@[sweep,shake],@[near,drift],@[shop,gamehome]];
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
    return [_contentArray[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [_contentArray count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[ThirdTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_contentArray[indexPath.section][indexPath.row]]];
    cell.label.text =_contentArray[indexPath.section][indexPath.row];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return 35;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self presentViewController:jumpArray[indexPath.section][indexPath.row] animated:NO completion:nil];
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
