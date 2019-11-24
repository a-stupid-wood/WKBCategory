//
//  UIImage+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (wkb_color)
/**
 *  根据颜色生成一张图片
 *  @param color 颜色
 */
+ (UIImage *)wkb_imageWithColor:(UIColor *)color;

/**
 *  根据字符串生成二维码图片
 *  @param qrString 字符串
 */
+ (UIImage *)wkb_createQRForString:(NSString *)qrString;

/**
 * 根据字符串和图片生成中间带图片的二维码图片
 * @param qrString 字符串
 * @param centerImage 居中的图片
 */
+ (UIImage *)wkb_createQRForString:(NSString *)qrString centerImage:(NSString *)centerImage;

/**
 *  压缩图片
 *  @param image 原图
 *  @param newSize 新的尺寸
 */
+ (UIImage*)wkb_imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 *  压缩图片
 *  @param maxLength 内容大小
 */
- (NSData *)wkb_compressQualityWithMaxLength:(NSInteger)maxLength;

@end


@interface UIImage (wkb_fixOrientation)

//调整image的方向
+ (UIImage *)wkb_fixOrientation:(UIImage *)aImage;

@end

NS_ASSUME_NONNULL_END
