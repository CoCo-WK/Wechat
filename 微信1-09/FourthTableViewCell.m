//
//  FourthTableViewCell.m
//  微信1-09
//
//  Created by dc004 on 16/1/11.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "FourthTableViewCell.h"

@implementation FourthTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"FourthTableViewCell" owner:nil options:nil];
    self = [array lastObject];
    [self layout];
    return self;
    
}
-(void)layout{
    
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(8, 3, 25, 23)];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(50, 3, 130, 30)];
    _label.font = [UIFont fontWithName:@"Arial" size:15];
    _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _rightButton.frame = CGRectMake(345, 3, 30, 30);
    [_rightButton setImage:[UIImage imageNamed:@"箭头"] forState:UIControlStateNormal];
    _rightButton.tintColor = [UIColor grayColor];

    [self addSubview:_label];
    [self addSubview:_imageview];
    [self addSubview:_rightButton];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
