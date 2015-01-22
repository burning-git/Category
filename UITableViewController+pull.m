//
//  UITableViewController+pull.m
//  pullTest
//
//  Created by gitBurning on 15/1/22.
//  Copyright (c) 2015年 gitBurning. All rights reserved.
//

#import "UITableViewController+pull.h"
#import <objc/runtime.h>
static const char * DictKey = "dict";
#define kPull_upKey @"pull_up"
@implementation UITableViewController (pull)
-(NSMutableDictionary *)evenDict{
    return objc_getAssociatedObject(self, &DictKey);
}
-(void)setEvenDict:(NSMutableDictionary *)evenDict{
    objc_setAssociatedObject(self, &DictKey, evenDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)addHeadViewPull:(void (^)(UITableViewController *))pull{
    
    self.evenDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:pull,kPull_upKey, nil];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    
    [self.refreshControl addTarget:self action:@selector(RefreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
    
    
}
-(void)RefreshViewControlEventValueChanged{
    if (self.refreshControl.isRefreshing) {
        
        [self headerBeginRefreshing];
    }
}

-(void)headerBeginRefreshing{
    
    if (!self.refreshControl.isRefreshing) {
        

        //修改 tablew的 contentoffset 挡住了 refreshControl
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^(void){
                             self.tableView.contentOffset = CGPointMake(0, -self.refreshControl.frame.size.height);
                         } completion:^(BOOL finished){
                             [self.refreshControl beginRefreshing];
                         }];
        
        void(^pull)(UITableViewController*tablew)=self.evenDict[kPull_upKey];
        
        if (pull) {
            pull(self);
        }

        
    }
    
    else{
        void(^pull)(UITableViewController*tablew)=self.evenDict[kPull_upKey];
        
        if (pull) {
            pull(self);
        }
    }
}

-(void)headerEndRefreshing{
    [self.refreshControl endRefreshing];
    
}

@end
