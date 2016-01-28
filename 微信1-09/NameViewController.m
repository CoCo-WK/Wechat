//
//  NameViewController.m
//  微信1-09
//
//  Created by dc004 on 16/1/12.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "NameViewController.h"
#import "NameTableViewCell.h"
#import "UserViewController.h"
@interface NameViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *array;
    NameTableViewCell *cell;
}
@end

@implementation NameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
   
        return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NameTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    array = [NSMutableArray arrayWithContentsOfFile:path];
    cell.textField.text = array[indexPath.section][indexPath.row][1];
    UIView *leftWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    leftWhite.backgroundColor = [UIColor whiteColor];
    cell.textField.leftViewMode = UITextFieldViewModeAlways;
    cell.textField.leftView = leftWhite;

        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 375, 45)];
    view.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(167,10 ,80 , 30)];
    label.text = @"名字";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial" size:20];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 10, 50, 30);
    [backButton setTitle:@"取消" forState:UIControlStateNormal];
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
    return 55;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}
-(void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)preserve{
    UserViewController *userViewCon = [[UserViewController alloc]init];
    array[0][0][1] = cell.textField.text;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"plist"];
    [array writeToFile:path atomically:YES];
    [self presentViewController:userViewCon animated:NO completion:nil];
  

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
