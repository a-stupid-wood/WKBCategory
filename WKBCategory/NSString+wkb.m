//
//  NSString+wkb.m
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import "NSString+wkb.h"

@implementation NSString (wkb)

- (BOOL)wkb_validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)wkb_validatePhone
{
    //谓词(过滤器)
    NSString *phoneRegex = @"1[3|4|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)wkb_validatePassWordLegal
{
    BOOL result = NO;
    
    NSString * regex = @"^[0-9A-Za-z]{6,12}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:self];
    
    return result;
}

+ (BOOL)wkb_blankString:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]] ){
        return  YES;
    }
    if ([string isEqual:[NSNull null]]){
        return  YES;
    }
    if (string == NULL || [string isEqual:nil] || [string isEqual:Nil] || string == nil){
        return  YES;
    }
    if([string isEqualToString:@"(null)"]){
        return  YES;
    }
    if([string isEqualToString:@"<null>"]){
        return  YES;
    }
    if (string.length == 0 || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
        return  YES;
    }
    return NO;
}

+ (NSString *)wkb_pinYinWithString:(NSString *)chinese
{
    NSString * pinYinStr = [NSString string];
    if (chinese.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:chinese];
        //1.先转换为带声调的拼音
        if(CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"pinyin: %@", pinYin);
        }
        //2.再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"pinyin: %@", pinYin);
            //3.去除掉首尾的空白字符和换行字符
            pinYinStr = [pinYin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            //4.去除掉其它位置的空白字符和换行字符
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
    }
    return pinYinStr;
}

@end
