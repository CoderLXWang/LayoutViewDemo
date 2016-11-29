//
//  UIColor+Hex.h
//  ShangBin
//
//  Created by Sharejoy on 15/6/9.
//  Copyright (c) 2015年 sharejoy. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (Hex)

/**
 * 设置16进制颜色值
 * 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 * 设置16进制颜色值
 * 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
