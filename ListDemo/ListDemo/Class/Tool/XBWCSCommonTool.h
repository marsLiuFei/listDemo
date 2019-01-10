//
//  XBWCSCommonTool.h
//  wcs
//
//  Created by 刘飞 on 2018/8/13.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBWCSCommonTool : NSObject
/**
 * 计算文本尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;
/**
 *  计算限定宽度文本尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;
/**
 *时间戳转时间
 */
+ (NSString *)timeStampStringToLocalTime:(NSString *)timeStampString;
@end
