//
//  NSString+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (wkb)

/**验证邮箱格式*/
- (BOOL)wkb_validateEmail;
/**验证手机号格式*/
- (BOOL)wkb_validatePhone;
/**验证密码是否合法*/
- (BOOL)wkb_validatePassWordLegal;
/**验证字符串是否为空*/
+ (BOOL)wkb_blankString:(NSString *)string;
/**将中文字符转化为对应的拼音*/
+ (NSString *)wkb_pinYinWithString:(NSString *)chinese;

@end

NS_ASSUME_NONNULL_END
