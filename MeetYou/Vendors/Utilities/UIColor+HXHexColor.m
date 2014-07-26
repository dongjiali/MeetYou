//
//  UIcolor+HXHexColor.m
//  HXHexColor
//
//  Created by Huang Xianshuai on 14-3-26.
//  Copyright (c) 2014年 HuangXianshuai. All rights reserved.
//

#import "UIColor+HXHexColor.h"

@implementation UIColor (HXHexColor)

// 固定透明度的Hex方法
+ (UIColor *)colorWithHex:(NSString *)hex
{
    return [UIColor colorWithHex:hex alpha:1.0f];
}

// 可变透明度的Hex方法
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(float)alpha
{
    NSString *colorString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 十六进制色值必须是6-8位
    if (colorString.length >= 6  && colorString.length  <= 8)
    {
        if ([colorString hasPrefix:@"0x"] || [colorString hasPrefix:@"0X"])
            colorString = [colorString substringFromIndex:2];
        else if ([colorString hasPrefix:@"#"])
            colorString = [colorString substringFromIndex:1];
        if (colorString.length != 6)
            return [UIColor clearColor];
    }
    else
        return [UIColor clearColor];
    
    // 将6位十六进制色值分成R、G、B
    NSRange redRange    = NSMakeRange(0, 2);
    NSRange greenRange  = NSMakeRange(2, 2);
    NSRange blueRange   = NSMakeRange(4, 2);
    NSString *redString     = [colorString substringWithRange:redRange];
    NSString *greenString   = [colorString substringWithRange:greenRange];
    NSString *blueString    = [colorString substringWithRange:blueRange];
    
    // 将RGB对应的十六进制色值转化位十进制
    unsigned int r, g, b;
    [[NSScanner scannerWithString:redString]    scanHexInt:&r];
    [[NSScanner scannerWithString:greenString]  scanHexInt:&g];
    [[NSScanner scannerWithString:blueString]   scanHexInt:&b];
    
    return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:alpha];
}

@end
