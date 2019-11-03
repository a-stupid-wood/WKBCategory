//
//  UIButton+wkb.m
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import "UIButton+wkb.h"
#import <objc/runtime.h>

@implementation UIButton (FixMultiClick)

static char wkb_acceptEventInterval;
static char wkb_acceptEventTime;

- (NSTimeInterval)wkb_acceptEventInterval
{
    return  [objc_getAssociatedObject(self, &wkb_acceptEventInterval) doubleValue];
}

- (void)setWkb_acceptEventInterval:(NSTimeInterval)wkb_acceptEventInterval
{
    objc_setAssociatedObject(self, &wkb_acceptEventInterval, @(wkb_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)wkb_acceptEventTime
{
    return  [objc_getAssociatedObject(self, &wkb_acceptEventTime) doubleValue];
}

- (void)setWkb_acceptEventTime:(NSTimeInterval)wkb_acceptEventTime
{
    objc_setAssociatedObject(self, &wkb_acceptEventTime, @(wkb_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 在load时执行hook
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        //分别获取
        SEL beforeSelector = @selector(sendAction:to:forEvent:);
        SEL afterSelector = @selector(wkb_sendAction:to:forEvent:);
        
        Method beforeMethod = class_getInstanceMethod(class, beforeSelector);
        Method afterMethod = class_getInstanceMethod(class, afterSelector);
        //先尝试给原来的方法添加实现，如果原来的方法不存在就可以添加成功。返回为YES，否则
        //返回为NO。
        //UIButton 真的没有sendAction方法的实现，这是继承了UIControl的而已，UIControl才真正的实现了。
        BOOL didAddMethod =
        class_addMethod(class,
                        beforeSelector,
                        method_getImplementation(afterMethod),
                        method_getTypeEncoding(afterMethod));
        NSLog(@"%d",didAddMethod);
        if (didAddMethod) {
            // 如果之前不存在，但是添加成功了，此时添加成功的是cs_sendAction方法的实现
            // 这里只需要方法替换
            class_replaceMethod(class,
                                afterSelector,
                                method_getImplementation(beforeMethod),
                                method_getTypeEncoding(beforeMethod));
        } else {
            //本来如果存在就进行交换
            method_exchangeImplementations(afterMethod, beforeMethod);
        }
    });
    
}

- (void)wkb_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.wkb_acceptEventTime < self.wkb_acceptEventInterval) {
        return;
    }
    
    if (self.wkb_acceptEventInterval > 0) {
        self.wkb_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self wkb_sendAction:action to:target forEvent:event];
}

@end

@implementation UIButton (EdgeInsertStyle)

- (void)wkb_layoutButtonWithEdgeInsetsStyle:(WKBButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space
{
    /**
        *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
        *  如果只有title，那它上下左右都是相对于button的，image也是一样；
        *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
        */
       
       // 1. 得到imageView和titleLabel的宽、高
       CGFloat imageWith = self.imageView.frame.size.width;
       CGFloat imageHeight = self.imageView.frame.size.height;
       
       CGFloat labelWidth = 0.0;
       CGFloat labelHeight = 0.0;
       if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
           // 由于iOS8中titleLabel的size为0，用下面的这种设置
           labelWidth = self.titleLabel.intrinsicContentSize.width;
           labelHeight = self.titleLabel.intrinsicContentSize.height;
       } else {
           labelWidth = self.titleLabel.frame.size.width;
           labelHeight = self.titleLabel.frame.size.height;
       }
       
       // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
       UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
       UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
       
       // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
       /**
        MKButtonEdgeInsetsStyleTop, // image在上，label在下
        MKButtonEdgeInsetsStyleLeft, // image在左，label在右
        MKButtonEdgeInsetsStyleBottom, // image在下，label在上
        MKButtonEdgeInsetsStyleRight // image在右，label在左
        */
       switch (style) {
           case WKBButtonEdgeInsetsStyleTop:
           {
               imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
               labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
           }
               break;
           case WKBButtonEdgeInsetsStyleLeft:
           {
               imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
               labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
           }
               break;
           case WKBButtonEdgeInsetsStyleBottom:
           {
               imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
               labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
           }
               break;
           case WKBButtonEdgeInsetsStyleRight:
           {
               imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
               labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
           }
               break;
           default:
               break;
       }
       
       // 4. 赋值
       self.titleEdgeInsets = labelEdgeInsets;
       self.imageEdgeInsets = imageEdgeInsets;
}

@end

@implementation UIButton (EnlargeTouchArea)

static char wkb_topNameKey;
static char wkb_rightNameKey;
static char wkb_bottomNameKey;
static char wkb_leftNameKey;

- (void)wkb_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &wkb_topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &wkb_rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &wkb_bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &wkb_leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &wkb_topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &wkb_rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &wkb_bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &wkb_leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
