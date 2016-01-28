//
//  NameTableViewCell.m
//  微信1-09
//
//  Created by dc004 on 16/1/12.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import "NameTableViewCell.h"

@implementation NameTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"NameTableViewCell" owner:nil options:nil];
    self = [array lastObject];
    [self layout];
    return self;
}
-(void)layout{
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 375, 30)];
    [self addSubview:_textField];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
