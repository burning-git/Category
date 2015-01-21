//
//  NSObject+blcok.h
//  buttonBlock
//
//  Created by gitBurning on 15/1/13.
//  Copyright (c) 2015年 gitBurning. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
typedef void(^buttonHandlerBlcok)(id sender);

@interface NSObject (blcok)
@property (nonatomic, copy) buttonHandlerBlcok eventHandler;
@property (nonatomic, strong) NSMutableDictionary * evenDict;

-(void)addHandAction:(void(^)(id sender ))handler;
@end
