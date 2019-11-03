//
//  UIColor+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (wkb)
/**不带透明度的颜色字符串*/
+ (UIColor *)wkb_colorFromHexStr:(NSString *)str;

/**带透明度的颜色字符串*/
+ (UIColor *)wkb_colorFromHexStrWithAlpa:(NSString *)str;

/**根据十六进制的RGB值返回对应的颜色*/
+ (UIColor *)wkb_colorFromHexRGB:(int)rgbValue;

/**根据十六进制的RGBA值返回对应的颜色*/
+ (UIColor *)wkb_colorFromHexRGBA:(int)rgbaValue;

/**根据十六进制的RGB值和alpha值返回对应的颜色*/
+ (UIColor *)wkb_colorFromHexRGB:(int)rgbValue alpha:(float)alpha;

/**返回一个随机的颜色*/
+ (UIColor *)wkb_randomColor;

@end

NS_ASSUME_NONNULL_END
