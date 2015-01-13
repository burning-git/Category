//
//  UILabel+Attributed.h
//  SaleHelper
//
//  Created by gitBurning on 14/12/8.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attributed)

/**
 *  富文
 *
 *  @param Attributed      需改变的字符串
 *  @param AttributedColor 需改变字符串的颜色
 *  @param AttributedFont  <#AttributedFont description#>
 */
-(void)setAttributedWithString:(NSString*)Attributed andAttributedColor:(UIColor*)AttributedColor andAttributedFont:(UIFont*)AttributedFont;


@end
