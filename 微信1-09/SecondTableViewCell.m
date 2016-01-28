//
//  SecondTableViewCell.m
//  微信1-09
//
//  Created by dc004 on 16/1/11.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"SecondTableViewCell" owner:nil options:nil];
    self = [array lastObject];
    [self layout];
    return self;
    
}
-(void)layout{
    
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(14, 8, 89, 90)];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(140, 80, 150, 20)];
    _label.font = [UIFont fontWithName:@"Arial" size:15];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 35, 180, 23)];
    _titleLabel.font = [UIFont fontWithName:@"Arial" size:22];
    _titleLabel.textColor = [UIColor redColor];
    [self addSubview:_titleLabel];
    [self addSubview:_label];
    [self addSubview:_imageview];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
