//
//  NSString+Trim.m
//  CommonUtility
//
//  Created by liusanchun on 14-7-25.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import "NSString+Trim.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Trim)

/**
 *  去除字符串的前后空格
 *
 *  @return 字符串
 */
- (NSString*)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


@end
