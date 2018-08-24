//
//  XBWCSMyOrderEvaluationCell.m
//  wcs
//
//  Created by 刘飞 on 2018/8/21.
//  Copyright © 2018年 ahxb. All rights reserved.
//  我的评价列表

#import "XBWCSMyOrderEvaluationCell.h"
#import "XBWCSMyOrderEvaluationImageView.h"
#import "XBWCSMyOrderEvaluationReplyView.h"

@interface XBWCSMyOrderEvaluationCell()
{
    //商品图片
    UIImageView *goodsImageView;
    //商品名称
    UILabel *goodsNameLabel;
    //添加时间
    UILabel *addTimeLabel;
    //商品评分
    AXRatingView *goodsRatingView;
    //服务评分
    AXRatingView *serviceRatingView;
    //商品评价
    UILabel *goodsEvaluationLabel;
    //服务评价描述
    UILabel *serviceEvaluationLabel;
    
    //商家回复view
    XBWCSMyOrderEvaluationReplyView *replyView;
}
//商品图片列表
@property(nonatomic, strong) XBWCSMyOrderEvaluationImageView *bottomView;
@end

@implementation XBWCSMyOrderEvaluationCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}

- (void )creatUI{
    UIView *topView = [ViewCreate createLineFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor];
    [self.contentView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(SIZE(90));
    }];
    
    goodsImageView = [ViewCreate createImageViewFrame:CGRectMake(0, 0, 0, 0) image:@""];
    [topView addSubview:goodsImageView];
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.width.height.offset(SIZE(70));
        make.left.offset(SIZE(10));
    }];
    
    addTimeLabel = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"" textColor:RGB153 textAlignment:Center font:FONT(12)];
    [topView addSubview:addTimeLabel];
    addTimeLabel.adjustsFontSizeToFitWidth = YES;
    [addTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-SIZE(10));
        make.centerY.offset(0);
        make.width.offset(SIZE(70));
    }];
    
    goodsNameLabel = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"" textColor:RGB46 textAlignment:Left font:FONT(15)];
    goodsNameLabel.adjustsFontSizeToFitWidth = YES;
    goodsNameLabel.numberOfLines = 2;
    [topView addSubview:goodsNameLabel];
    [goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->goodsImageView.mas_right).offset(SIZE(5));
        make.right.mas_equalTo(self->addTimeLabel.mas_left).offset(SIZE(-5));
        make.height.offset(SIZE(50));
    }];
    UILabel *la0 = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"商品" textColor:RGB153 textAlignment:Center font:FONT(12)];
    [topView addSubview:la0];
    la0.adjustsFontSizeToFitWidth = YES;
    [la0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->goodsImageView.mas_right).offset(SIZE(5));\
        make.bottom.offset(-SIZE(5));
        make.height.offset(SIZE(25));
        make.width.offset(SIZE(30));
    }];
    goodsRatingView  = [[AXRatingView alloc] init];
    goodsRatingView.baseColor = RGB(223, 223, 223);
    [goodsRatingView setStepInterval:1];
    goodsRatingView.value = 0;
//    if (isIPhone5) {
        goodsRatingView.markFont = FONT(16);
//    }else{
//        goodsRatingView.markFont = FONT(18);
//    }
    
    goodsRatingView.userInteractionEnabled = NO;
    [topView addSubview:goodsRatingView];
    [goodsRatingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(la0.mas_right).offset(SIZE(3));
        make.height.offset(SIZE(25));
        make.centerY.mas_equalTo(la0.mas_centerY).offset(0);
    }];
    
    
    
    UILabel *la1 = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"服务" textColor:RGB153 textAlignment:Center font:FONT(12)];
    [topView addSubview:la1];
    la1.adjustsFontSizeToFitWidth = YES;
    [la1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->goodsRatingView.mas_right).offset(SIZE(5));
        make.bottom.offset(-SIZE(5));
        make.height.offset(SIZE(25));
        make.width.offset(SIZE(30));
    }];
    
    
    serviceRatingView  = [[AXRatingView alloc] init];
    serviceRatingView.baseColor = RGB(223, 223, 223);
    [serviceRatingView setStepInterval:1];
    serviceRatingView.value = 0;
//    if (isIPhone5) {
        serviceRatingView.markFont = FONT(16);
//    }else{
//        serviceRatingView.markFont = FONT(17);
//    }
    serviceRatingView.userInteractionEnabled = NO;
    [topView addSubview:serviceRatingView];
    [serviceRatingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->addTimeLabel.mas_left).offset(-SIZE(5));
        make.height.offset(SIZE(25));
        make.centerY.mas_equalTo(la0.mas_centerY).offset(0);
        make.left.mas_equalTo(la1.mas_right).offset(0);
        make.width.mas_equalTo(self->goodsRatingView.mas_width).offset(0);
    }];
    
    
    
    
    UILabel *la2 = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"商品评价:" textColor:RGB46 textAlignment:Left font:FONT(15)];
    la2.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:la2];
    [la2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SIZE(10));
        make.top.mas_equalTo(topView.mas_bottom).offset(0);
        make.height.offset(SIZE(20));
        make.width.offset(SIZE(70));
    }];
    
    goodsEvaluationLabel = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"" textColor:RGB46 textAlignment:Left font:FONT(15)];
    [self.contentView addSubview:goodsEvaluationLabel];
    goodsEvaluationLabel.numberOfLines = 0;
    [goodsEvaluationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-SIZE(10));
        make.left.mas_equalTo(la2.mas_right).offset(0);
        make.top.mas_equalTo(la2.mas_top).offset(0);
        make.height.mas_greaterThanOrEqualTo(SIZE(20));
    }];
    
    
    UILabel *la3 = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"服务评价:" textColor:RGB46 textAlignment:Left font:FONT(15)];
    la3.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:la3];
    [la3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SIZE(10));
        make.top.mas_equalTo(self->goodsEvaluationLabel.mas_bottom).offset(SIZE(5));
        make.height.offset(SIZE(20));
        make.width.offset(SIZE(70));
    }];
    
    serviceEvaluationLabel = [ViewCreate createLabelFrame:CGRectMake(0, 0, 0, 0) backgroundColor:ClearColor text:@"" textColor:RGB46 textAlignment:Left font:FONT(15)];
    [self.contentView addSubview:serviceEvaluationLabel];
    serviceEvaluationLabel.numberOfLines = 0;
    [serviceEvaluationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-SIZE(10));
        make.left.mas_equalTo(la3.mas_right).offset(0);
        make.top.mas_equalTo(la3.mas_top).offset(0);
        make.height.mas_greaterThanOrEqualTo(SIZE(20));
    }];
    
    self.bottomView = [XBWCSMyOrderEvaluationImageView new];
    self.bottomView.hidden = YES;
    WS(bself);
    self.bottomView.imageClickBlock = ^(NSInteger index, NSArray *imageArray) {
        if (bself.imageClickBlock) {
            bself.imageClickBlock(index,bself.bottomView, imageArray);
        }
    };
    [self.contentView addSubview:self.bottomView];
    CGFloat w = (SCREEN_WIDTH-SIZE(50))/4.f;
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(self->serviceEvaluationLabel.mas_bottom).offset(0);
        make.height.offset(w+SIZE(20));
    }];
    replyView = [XBWCSMyOrderEvaluationReplyView new];
    replyView.hidden = YES;
    [self.contentView addSubview:replyView];
    [replyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SIZE(10));
        make.right.offset(-SIZE(10));
        make.top.mas_equalTo(self.bottomView.mas_bottom).offset(0);
    }];
    UIView *line = [ViewCreate createLineFrame:CGRectMake(0, 0, 0, 0) backgroundColor:RGB(234, 234, 234)];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(SIZE(0.5));
    }];
}


-(void)setTModel:(XBWCSMyOrderEvalutaionModel *)tModel{
    _tModel = tModel;
    [goodsImageView sd_setImageWithURL:[NSURL URLWithString:_tModel.deputyPic]];
    goodsNameLabel.text = isEmptyStr(_tModel.comName)?@"":_tModel.comName;
    NSString *timeStr = _tModel.addDatetime;
    addTimeLabel.text = timeStr;
    goodsRatingView.value = [_tModel.productScore integerValue];
    serviceRatingView.value = [_tModel.serviceScore integerValue];
    goodsEvaluationLabel.text = isEmptyStr(_tModel.productDes)?@"":_tModel.productDes;
    serviceEvaluationLabel.text = isEmptyStr(_tModel.serviceDes)?@"":_tModel.serviceDes;
    self.bottomView.hidden = isEmptyStr(_tModel.pic)?YES:NO;
    if (!isEmptyStr(_tModel.pic)) {
        NSArray *imgs = [_tModel.pic componentsSeparatedByString:@","];
        self.bottomView.imageArray = imgs;
    }else{
        [replyView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(SIZE(10));
            make.right.offset(-SIZE(10));
            make.top.mas_equalTo(self->serviceEvaluationLabel.mas_bottom).offset(0);
        }];
    }
    replyView.hidden = isEmptyStr(_tModel.reply)?YES:NO;
    if (!isEmptyStr(_tModel.reply)) {
        replyView.content = [NSString stringWithFormat:@"商家回复:%@",_tModel.reply];
    }
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.bottomView.hidden = YES;
    for (UIView *view in self.bottomView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = YES;
        }
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
