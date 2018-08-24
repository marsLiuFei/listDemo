//
//  XBWCSMyOrderEvaluationCell.h
//  wcs
//
//  Created by 刘飞 on 2018/8/21.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBWCSMyOrderEvalutaionModel.h"

@interface XBWCSMyOrderEvaluationCell : UITableViewCell
/**
 *  <#define#>
 */
@property(nonatomic, strong)XBWCSMyOrderEvalutaionModel *tModel;

/**
 *  点击了哪个图片
 */
@property(nonatomic, copy)void (^imageClickBlock)(NSInteger index,UIView *view,NSArray *imageArray);

@end
