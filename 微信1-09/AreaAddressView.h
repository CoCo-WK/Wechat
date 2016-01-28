//
//  AreaAddressView.h
//  微信1-09
//
//  Created by dc004 on 16/1/14.
//  Copyright © 2016年 王珂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaAddressView : UIView
- (instancetype)init;

@property (nonatomic, copy) NSString *province; // 省份
@property (nonatomic, copy) NSString *city;  // 城市
@property (nonatomic, copy) NSString *area;  // 地区


@end
