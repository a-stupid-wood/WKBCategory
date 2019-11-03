//
//  UIButton+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIButton (FixMultiClick)

//重复点击的间隔
@property (nonatomic, assign) NSTimeInterval wkb_acceptEventInterval;
//上一次点击的时间
@property (nonatomic, assign) NSTimeInterval wkb_acceptEventTime;

@end


// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, WKBButtonEdgeInsetsStyle) {
    WKBButtonEdgeInsetsStyleTop, // image在上，label在下
    WKBButtonEdgeInsetsStyleLeft, // image在左，label在右
    WKBButtonEdgeInsetsStyleBottom, // image在下，label在上
    WKBButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (EdgeInsertStyle)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)wkb_layoutButtonWithEdgeInsetsStyle:(WKBButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end


@interface UIButton (EnlargeTouchArea)

/**通过在上下左右增加按钮可响应点击的范围，不过增大的点击范围不能超过按钮的父视图，否则无效*/
- (void)wkb_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end

NS_ASSUME_NONNULL_END
