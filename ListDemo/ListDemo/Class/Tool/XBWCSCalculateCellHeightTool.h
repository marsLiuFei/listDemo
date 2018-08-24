//
//  XBWCSCalculateCellHeightTool.h
//  wcs
//
//  Created by 刘飞 on 2018/8/9.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBWCSMyOrderEvalutaionModel.h"

@interface XBWCSCalculateCellHeightTool : NSObject

+(instancetype)Instance;


/**
 *  计算我的评价cell的高度
 */
- (CGFloat )CalculateCellHeightWithXBWCSMyOrderEvalutaionModel:(XBWCSMyOrderEvalutaionModel *)myOrderEvalutaionModel;


@end
