//
//  UIView+wkb.m
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import "UIView+wkb.h"

@implementation UIView (frame)

- (void)setWkb_x:(CGFloat)wkb_x
{
    CGRect frame = self.frame;
    frame.origin.x = wkb_x;
    self.frame = frame;
}

- (CGFloat)wkb_x
{
    return self.frame.origin.x;
}

- (void)setWkb_y:(CGFloat)wkb_y
{
    CGRect frame = self.frame;
    frame.origin.y = wkb_y;
    self.frame = frame;
}

- (CGFloat)wkb_y
{
    return self.frame.origin.y;
}

- (void)setWkb_width:(CGFloat)wkb_width
{
    CGRect frame = self.frame;
    frame.size.width = wkb_width;
    self.frame = frame;
}

- (CGFloat)wkb_width
{
    return self.frame.size.width;
}

- (void)setWkb_height:(CGFloat)wkb_height
{
    CGRect frame = self.frame;
    frame.size.height = wkb_height;
    self.frame= frame;
}

- (CGFloat)wkb_height
{
    return self.frame.size.height;
}

- (void)setWkb_right:(CGFloat)wkb_right
{
    self.wkb_x = wkb_right - self.wkb_width;
}

- (CGFloat)wkb_right
{
    return self.wkb_x + self.wkb_width;
}

- (void)setWkb_bottom:(CGFloat)wkb_bottom
{
    self.wkb_y = wkb_bottom - self.wkb_height;
}

- (CGFloat)wkb_bottom
{
    return self.wkb_y + self.wkb_height;
}

- (void)setWkb_size:(CGSize)wkb_size
{
    CGRect frame = self.frame;
    frame.size = wkb_size;
    self.frame = frame;
}

- (CGSize)wkb_size
{
    return self.frame.size;
}

- (void)setWkb_centerX:(CGFloat)wkb_centerX
{
    CGPoint center = self.center;
    center.x = wkb_centerX;
    self.center = center;
}

- (CGFloat)wkb_centerX
{
    return self.center.x;
}

- (void)setWkb_centerY:(CGFloat)wkb_centerY
{
    CGPoint center = self.center;
    center.y = wkb_centerY;
    self.center = center;
}

- (CGFloat)wkb_centerY
{
    return self.center.y;
}

- (void)setWkb_borderWidth:(CGFloat)wkb_borderWidth
{
    
    if (wkb_borderWidth < 0) {
        return;
    }
    self.layer.borderWidth = wkb_borderWidth;
}

- (CGFloat)wkb_borderWidth
{
    return self.wkb_borderWidth;
}

- (void)setWkb_borderColor:(UIColor *)wkb_borderColor
{
    self.layer.borderColor = wkb_borderColor.CGColor;
}

- (UIColor *)wkb_borderColor
{
    return self.wkb_borderColor;
    
}

- (void)setWkb_cornerRadius:(CGFloat)wkb_cornerRadius
{
    self.layer.cornerRadius = wkb_cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)wkb_cornerRadius
{
    return self.wkb_cornerRadius;
}

- (void)wkb_alignHorizontal
{
    self.wkb_x = (self.superview.wkb_width - self.wkb_width) * 0.5;
}

- (void)wkb_alignVertical
{
    self.wkb_y = (self.superview.wkb_height - self.wkb_height) *0.5;
}


@end
