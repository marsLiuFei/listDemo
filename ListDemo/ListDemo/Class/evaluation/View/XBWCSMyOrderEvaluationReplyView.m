//
//  XBWCSMyOrderEvaluationReplyView.m
//  wcs
//
//  Created by 刘飞 on 2018/8/22.
//  Copyright © 2018年 ahxb. All rights reserved.
//  商家回复的view

#import "XBWCSMyOrderEvaluationReplyView.h"

@implementation XBWCSMyOrderEvaluationReplyView
{
    UILabel *replyLabel;//商家评论的label
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = NORMAL_BGCOLOR;
        [self creatUI];
    }
    return self;
}

-(void )creatUI{
    replyLabel = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"" textColor:RGB135 textAlignment:Left font:FONT(13)];
    [self addSubview:replyLabel];
    replyLabel.numberOfLines = 0;
    [replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(SIZE(5));
        make.bottom.right.offset(-SIZE(5));
    }];
}
-(void)setContent:(NSString *)content{
    _content = content;
    replyLabel.text = _content;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
