//
//  UIcolor+HXHexColor.h
//  HXHexColor
//
//  Created by Huang Xianshuai on 14-3-26.
//  Copyright (c) 2014年 HuangXianshuai. All rights reserved.
//



@interface UIColor (HXHexColor)

+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(float)alpha;

@end
