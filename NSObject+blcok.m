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

static const char * DictKey = "dict";
#define kBlockKey @"key"
@implementation NSObject (blcok)


#pragma mark---block property
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
        
        
        if (self.evenDict)  //判断 属性和方法共存的时候，清空一个
        {
            self.evenDict=nil;
        }
        
    }
    
  
    
}

#pragma mark---other property

-(NSMutableDictionary *)evenDict{
    return objc_getAssociatedObject(self, &DictKey);
}
-(void)setEvenDict:(NSMutableDictionary *)evenDict{
    objc_setAssociatedObject(self, &DictKey, evenDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)addHandAction:(void (^)(id))handler{
    
    self.evenDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:handler,kBlockKey, nil];
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
    
    
    if (self.eventHandler) //判断 属性和方法共存的时候，清空一个
    {
        self.eventHandler=nil;
    }

}




#pragma mark-----evenHandler
-(void)touchUpAcntion{
    
    if (self.eventHandler) {
        self.eventHandler(self);
    }
    else{
        void (^tag)(id sender)=self.evenDict[kBlockKey];
        tag(self);
    }
    
    
}

@end
