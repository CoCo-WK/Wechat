//
//  TwoViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/9.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "TwoViewController.h"
#import "SecondTableViewCell.h"
@interface TwoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
}

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
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
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
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
