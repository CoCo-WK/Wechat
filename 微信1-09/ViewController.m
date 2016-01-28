//
//  ViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/9.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"微信";
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.4 alpha:1];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];

    [self layout];
}
-(void)layout{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
