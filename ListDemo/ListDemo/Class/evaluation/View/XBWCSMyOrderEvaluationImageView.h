//
//  XBWCSMyOrderEvaluationImageView.h
//  wcs
//
//  Created by 刘飞 on 2018/8/21.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBWCSMyOrderEvaluationImageView : UIView
/**
 *
 */
@property(nonatomic, strong)NSArray *imageArray;

/**
 *  点击了哪个图片
 */
@property(nonatomic, copy)void (^imageClickBlock)(NSInteger index,NSArray *imageArray);

@end
