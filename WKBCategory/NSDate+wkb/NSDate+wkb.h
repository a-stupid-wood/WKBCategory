//
//  NSDate+wkb.h
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (wkb)

@property (nonatomic, copy, readonly) NSString *wkb_year;
@property (nonatomic, copy, readonly) NSString *wkb_month;
@property (nonatomic, copy, readonly) NSString *wkb_day;
@property (nonatomic, copy, readonly) NSString *wkb_hour;
@property (nonatomic, copy, readonly) NSString *wkb_minute;
@property (nonatomic, copy, readonly) NSString *wkb_seconds;

/**是否为今天*/
- (BOOL)wkb_isToday;
/**是否为昨天*/
- (BOOL)wkb_isYesterday;
/**是否为今年*/
- (BOOL)wkb_isThisYear;
/**返回一个只有年月日的时间*/
- (instancetype)wkb_dateWithYMD;
/**返回一个只有年月日的时间字符串*/
+ (NSString *)wkb_yearMonthDay;
/** 获得与当前时间的差距*/
- (NSDateComponents *)wkb_deltaWithNow;
/**生成分秒格式的时间*/
+(NSString *)wkb_formatTimeTominSecWithNumber:(NSNumber *)number;
/**生成年－月－日 时：分的时间*/
+ (NSString *)wkb_formatTimeToYMDHM:(NSNumber *)number;
/**格式化时间: 根据与现在的时间差距返回昨天、一周前、一个月前等字符串*/
+ (NSString *)wkb_formatTimeWithNumber:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
