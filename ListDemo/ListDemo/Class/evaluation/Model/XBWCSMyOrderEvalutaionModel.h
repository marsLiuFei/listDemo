//
//  XBWCSMyOrderEvalutaionModel.h
//  wcs
//
//  Created by 刘飞 on 2018/8/21.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBWCSMyOrderEvalutaionModel : NSObject

/**
 *  deputyPic:商品图片
 */
@property(nonatomic, copy)NSString *deputyPic;
/**
 *  ID:评论Id
 */
@property(nonatomic, copy)NSString *ID;
/**
 *  comName:商品名
 */
@property(nonatomic, copy)NSString *comName;

/**
 *  addDatetime:添加时间
 */
@property(nonatomic, copy)NSString *addDatetime;
/**
 *  pic:评论图片
 */
@property(nonatomic, copy)NSString *pic;

/**
 *  productDes:商品评价
 */
@property(nonatomic, copy)NSString *productDes;
/**
 *  productScore:商品得分
 */
@property(nonatomic, copy)NSString *productScore;

/**
 *  serviceDes:服务评价
 */
@property(nonatomic, copy)NSString *serviceDes;
/**
 *  serviceScore:服务分
 */
@property(nonatomic, copy)NSString *serviceScore;
/**
 *  reply:商家回复
 */
@property(nonatomic, copy)NSString *reply;
/**
 *  行高
 */
@property(nonatomic, assign)CGFloat cellHeight;


@end
