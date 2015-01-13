//
//  NSObject+blcok.m
//  buttonBlock
//
//  Created by gitBurning on 15/1/13.
//  Copyright (c) 2015年 gitBurning. All rights reserved.
//

#import "NSObject+blcok.h"
#import <UIKit/UIKit.h>
static const char * UtilityKey = "buttonBlock";

@implementation NSObject (blcok)

- (buttonHandlerBlcok)eventHandler {
    
    return objc_getAssociatedObject(self, &UtilityKey);
    
}

- (void)setEventHandler:(buttonHandlerBlcok)eventHandler {
    
    objc_setAssociatedObject(self, &UtilityKey, eventHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (eventHandler) {
        if ([self isKindOfClass:[UIButton class]]) {
            
            UIButton * button=(UIButton*)self;
            [button addTarget:self action:@selector(touchUpAcntion) forControlEvents:UIControlEventTouchUpInside];

            
        }
        else if ([self isKindOfClass:[UIImageView class]] || [self isKindOfClass:[UIView class]]){
            
            UIImageView * image=(UIImageView*)self;
            image.userInteractionEnabled=YES;
            UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchUpAcntion)];
            [image addGestureRecognizer:tap];
            tap=nil;
        }
        
        
    }
    
    
    
}

-(void)touchUpAcntion{
    
    self.eventHandler(self);
}

@end
