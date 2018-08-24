//
//  XBWCSCalculateCellHeightTool.m
//  wcs
//
//  Created by 刘飞 on 2018/8/9.
//  Copyright © 2018年 ahxb. All rights reserved.
//  计算cell高度

#import "XBWCSCalculateCellHeightTool.h"


#define kNameFont FONT(16)
#define kTimeFont FONT(13)
#define kContentFont FONT(14)


@interface XBWCSCalculateCellHeightTool()

@end

static XBWCSCalculateCellHeightTool *instance = nil;

@implementation XBWCSCalculateCellHeightTool

+(instancetype)Instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XBWCSCalculateCellHeightTool alloc] init];
    });
    return instance;
}

/**
 *  计算我的评价cell的高度
 */
- (CGFloat )CalculateCellHeightWithXBWCSMyOrderEvalutaionModel:(XBWCSMyOrderEvalutaionModel *)myOrderEvalutaionModel{
    CGFloat totalHeight = 0.f;
    CGFloat topviewHeight = SIZE(90);
    totalHeight = topviewHeight;
    
    CGSize goodsEvaluationSize = [XBWCSCommonTool sizeWithText:myOrderEvalutaionModel.productDes font:FONT(15) maxW:SCREEN_WIDTH-SIZE(90)];
    CGFloat goodsEvaluationHeight = goodsEvaluationSize.height<SIZE(25)?SIZE(25):goodsEvaluationSize.height;
    totalHeight = totalHeight+ goodsEvaluationHeight+SIZE(5);
    CGSize serviceEvaluationSize = [XBWCSCommonTool sizeWithText:myOrderEvalutaionModel.serviceDes font:FONT(15) maxW:SCREEN_WIDTH-SIZE(90)];
    CGFloat serviceEvaluationHeight = serviceEvaluationSize.height<SIZE(25)?SIZE(25):serviceEvaluationSize.height;
    totalHeight = totalHeight+ serviceEvaluationHeight;
    
    CGFloat imgW = (SCREEN_WIDTH-SIZE(50))/4.f+SIZE(20);
    if (!isEmptyStr(myOrderEvalutaionModel.pic)) {
        totalHeight = totalHeight+ imgW;
    }
    
    CGSize replySize = [XBWCSCommonTool sizeWithText:[NSString stringWithFormat:@"商家回复:%@",myOrderEvalutaionModel.reply] font:FONT(13) maxW:SCREEN_WIDTH-SIZE(30)];
    CGFloat replyHeight = isEmptyStr(myOrderEvalutaionModel.reply)?SIZE(10):replySize.height+SIZE(20);
    totalHeight = totalHeight + replyHeight;
    return totalHeight;
}





@end
