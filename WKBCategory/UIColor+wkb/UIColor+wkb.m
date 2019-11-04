//
//  UIColor+wkb.m
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import "UIColor+wkb.h"

@implementation UIColor (wkb)

+ (UIColor *)wkb_colorFromHexStr:(NSString *)str
{
    NSString *colorStr = [str stringByReplacingOccurrencesOfString:@"#" withString:@""];
    unsigned int baseValue;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&baseValue];
    float red = ((baseValue >> 16) & 0xFF) / 255.0f;
    float green = ((baseValue >> 8) & 0xFF) / 255.0f;
    float blue = ((baseValue >> 0) & 0xFF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)wkb_colorFromHexStrWithAlpa:(NSString *)str
{
    NSString *colorStr = [str stringByReplacingOccurrencesOfString:@"#" withString:@""];
    unsigned int baseValue;
    [[NSScanner scannerWithString:colorStr] scanHexInt:&baseValue];
    float red = ((baseValue >> 24) & 0xFF) / 255.0f;
    float green = ((baseValue >> 16) & 0xFF) / 255.0f;
    float blue = ((baseValue >> 8) & 0xFF) / 255.0f;
    float alpha = ((baseValue >> 0) & 0xFF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)wkb_colorFromHexRGB:(int)rgbValue
{
    float red = ((rgbValue >> 16) & 0xFF) / 255.0f;
    float green = ((rgbValue >> 8) & 0xFF) / 255.0f;
    float blue = ((rgbValue >> 0) & 0xFF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)wkb_colorFromHexRGBA:(int)rgbaValue
{
    float red = ((rgbaValue >> 24) & 0xFF) / 255.0f;
    float green = ((rgbaValue >> 16) & 0xFF) / 255.0f;
    float blue = ((rgbaValue >> 8) & 0xFF) / 255.0f;
    float alpha = ((rgbaValue >> 0) & 0xFF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)wkb_colorFromHexRGB:(int)rgbValue alpha:(float)alpha
{
    float red = ((rgbValue >> 16) & 0xFF) / 255.0f;
    float green = ((rgbValue >> 8) & 0xFF) / 255.0f;
    float blue = ((rgbValue >> 0) & 0xFF) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)wkb_randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
}

@end
