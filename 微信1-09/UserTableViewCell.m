//
//  UserTableViewCell.m
//  微信1-09
//
//  Created by dc004 on 16/1/11.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"UserTableViewCell" owner:nil options:nil];
    self = [array lastObject];
    [self layout];
    return self;
    
}
-(void)layout{
    
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(5, 3, 28, 28)];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(5, 3, 130, 30)];
    _label.font = [UIFont fontWithName:@"Arial" size:17];
    _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _rightButton.frame = CGRectMake(345, 3, 30, 30);
    [_rightButton setImage:[UIImage imageNamed:@"箭头"] forState:UIControlStateNormal];
    _rightButton.tintColor = [UIColor grayColor];
    _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 3, 140, 30)];
    _messageLabel.font = [UIFont fontWithName:@"Arial" size:16];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
    [self addSubview:_imageview];
    [self addSubview:_rightButton];
    [self addSubview:_messageLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
