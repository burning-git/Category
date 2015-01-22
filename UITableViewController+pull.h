//
//  UITableViewController+pull.h
//  pullTest
//
//  Created by gitBurning on 15/1/22.
//  Copyright (c) 2015年 gitBurning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewController (pull)
@property (nonatomic, strong) NSMutableDictionary * evenDict;

-(void)addHeadViewPull:(void(^)(UITableViewController* tablewVC))pull;

-(void)headerBeginRefreshing;

-(void)headerEndRefreshing;
@end
