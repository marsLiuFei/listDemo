//
//  XBWCSMyOrderEvaluationImageView.m
//  wcs
//
//  Created by 刘飞 on 2018/8/21.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import "XBWCSMyOrderEvaluationImageView.h"

@implementation XBWCSMyOrderEvaluationImageView
{
    NSMutableArray *arrM;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}

- (void )creatUI{
    arrM = [NSMutableArray new];
    CGFloat w = (SCREEN_WIDTH-SIZE(50))/4.f;
    for (int i=0; i<4; i++) {
        UIImageView *img = [ViewCreate createImageViewFrame:CGRectMake(SIZE(10)+(SIZE(10)+w)*i, SIZE(10), w, w) image:@""];
        
        img.hidden = YES;
        [self addSubview:img];
        [arrM addObject:img];
    }
}


- (void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    for (int i=0; i<((_imageArray.count>arrM.count)?arrM.count:_imageArray.count); i++) {
        UIImageView *img = arrM[i];
        img.hidden = NO;
        img.userInteractionEnabled = YES;
        img.tag = i;
        [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        [img sd_setImageWithURL:[NSURL URLWithString:_imageArray[i]]];
    }
    
}
- (void )tap:(UITapGestureRecognizer *)tap{
    if (self.imageClickBlock) {
        self.imageClickBlock(tap.view.tag, _imageArray);
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
