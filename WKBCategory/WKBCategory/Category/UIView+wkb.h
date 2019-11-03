//
//  UIView+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frame)

@property (nonatomic, assign)CGFloat wkb_x;
@property (nonatomic, assign)CGFloat wkb_y;
@property (nonatomic, assign)CGFloat wkb_width;
@property (nonatomic, assign)CGFloat wkb_height;
@property (nonatomic, assign)CGFloat wkb_right;
@property (nonatomic, assign)CGFloat wkb_bottom;
@property (nonatomic, assign)CGFloat wkb_centerX;
@property (nonatomic, assign)CGFloat wkb_centerY;
@property (nonatomic, assign)CGSize wkb_size;
@property(nonatomic, assign) IBInspectable CGFloat wkb_borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *wkb_borderColor;
@property(nonatomic, assign) IBInspectable CGFloat wkb_cornerRadius;

/** 水平居中*/
- (void)wkb_alignHorizontal;

/** 垂直居中*/
- (void)wkb_alignVertical;

@end

NS_ASSUME_NONNULL_END
