//
//  UILabel+Attributed.m
//  SaleHelper
//
//  Created by gitBurning on 14/12/8.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import "UILabel+Attributed.h"

@implementation UILabel (Attributed)
-(void)setAttributedWithString:(NSString *)Attributed andAttributedColor:(UIColor *)AttributedColor andAttributedFont:(UIFont *)AttributedFont{
    
    NSRange rang=[self.text rangeOfString:Attributed];
    
    UIColor * cuttentColor=AttributedColor?AttributedColor:self.textColor;
    
    NSMutableAttributedString * string=[[NSMutableAttributedString alloc] initWithString:self.text];
    [string addAttribute:NSForegroundColorAttributeName value:cuttentColor range:rang];
    
    if (AttributedFont) {
        [string addAttribute:NSFontAttributeName value:AttributedFont range:rang];

    }
    self.attributedText=string;
}
@end
