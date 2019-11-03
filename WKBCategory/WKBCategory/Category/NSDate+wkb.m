//
//  NSDate+wkb.m
//  WKBCategory
//
//  Created by 王凯彬 on 2019/11/3.
//  Copyright © 2019 王凯彬. All rights reserved.
//

#import "NSDate+wkb.h"

@implementation NSDate (wkb)

- (BOOL)wkb_isToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

- (BOOL)wkb_isYesterday {
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] wkb_dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self wkb_dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (BOOL)wkb_isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (instancetype)wkb_dateWithYMD {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

+ (NSString *)wkb_yearMonthDay {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSString *currentDateString = [dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateString;
    
}

- (NSDateComponents *)wkb_deltaWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

+(NSString *)wkb_formatTimeTominSecWithNumber:(NSNumber *)number
{
    NSInteger doubleTempTime = [number integerValue];
    return [NSString stringWithFormat:@"%02ld:%02ld",doubleTempTime/60,doubleTempTime%60];
}

+ (NSString *)wkb_formatTimeToYMDHM:(NSNumber *)number
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    double doubleTempTime = [number doubleValue]/1000;
    NSTimeInterval timestamp = (NSTimeInterval)doubleTempTime;
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}


+ (NSString *)wkb_formatTimeWithNumber:(NSNumber *)number
{
    double doubleTempTime = [number doubleValue]/1000;
    NSTimeInterval timestamp = (NSTimeInterval)doubleTempTime;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    // 判断是否为今年
    if (date.wkb_isThisYear) {
        NSDateComponents *cmps = [date wkb_deltaWithNow];
        if (cmps.month == 0) { // 一个月之内
            if (date.wkb_isToday) { // 今天
                if (cmps.hour >= 1) { // 至少是1小时前发的
                    NSLog(@"%@",cmps);
                    return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
                } else if (cmps.minute >= 1) { // 1~59分钟之前发的
                    return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
                } else { // 1分钟内发的
                    return @"刚刚";
                }
            } else if (date.wkb_isYesterday) { // 昨天
                fmt.dateFormat = @"昨天";
                return [fmt stringFromDate:date];
            } else {
                return [NSString stringWithFormat:@"%ld天前", (long)cmps.day];
            }
        } else if (cmps.month < 7) { // 一个月之外且半年之内
            return [NSString stringWithFormat:@"%ld个月前", (long)cmps.month];
        } else { // 半年之外且一年之内
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:date];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt stringFromDate:date];
    }
}



- (NSString *)wkb_year
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy";
    return [fmt stringFromDate:self];
}

- (NSString *)wkb_month
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"MM";
    return [fmt stringFromDate:self];
}

- (NSString *)wkb_day
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"dd";
    return [fmt stringFromDate:self];
}

- (NSString *)wkb_hour
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH";
    return [fmt stringFromDate:self];
}

- (NSString *)wkb_minute
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"mm";
    return [fmt stringFromDate:self];
}

- (NSString *)wkb_seconds
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"ss";
    return [fmt stringFromDate:self];
}

@end
