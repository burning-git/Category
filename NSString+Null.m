//
//  NSString+Null.m
//  SaleHelper
//
//  Created by gitBurning on 14/12/4.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import "NSString+Null.h"

@implementation NSObject (Null)
-(id )isNullString{
    if ([self isKindOfClass:[NSNull class]]) {
         return @"";
    }
    
    return self;
}
@end
