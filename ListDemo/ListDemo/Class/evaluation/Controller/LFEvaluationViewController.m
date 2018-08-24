//
//  LFEvaluationViewController.m
//  ListDemo
//
//  Created by 刘飞 on 2018/8/24.
//  Copyright © 2018年 ahxb. All rights reserved.
//

#import "LFEvaluationViewController.h"
#import "GKPhotoBrowser.h"//查看大图
#import "XBWCSMyOrderEvaluationCell.h"
#import "XBWCSCalculateCellHeightTool.h"
#import "MJExtension.h"

@interface LFEvaluationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *sourceDataArray;
@end

@implementation LFEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品评价";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"sourcedata.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *arr = [XBWCSMyOrderEvalutaionModel mj_objectArrayWithKeyValuesArray:dic[@"sourcedata"]];
    for (int i=0; i<arr.count; i++) {
        XBWCSMyOrderEvalutaionModel *model = arr[i];
        model.cellHeight = [[XBWCSCalculateCellHeightTool Instance] CalculateCellHeightWithXBWCSMyOrderEvalutaionModel:model];
    }
    self.sourceDataArray = arr.mutableCopy;
    [self initTableView];
}
- (void )initTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT,SCREEN_WIDTH, SCREEN_HEIGHT -NAV_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = NORMAL_BGCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[XBWCSMyOrderEvaluationCell class] forCellReuseIdentifier:@"XBWCSMyOrderEvaluationCell"];
    [self.view addSubview:_tableView];
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
    }
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.right.bottom.mas_offset(0);
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBWCSMyOrderEvalutaionModel *model = self.sourceDataArray[indexPath.row];
    return model.cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WS(bself);
    XBWCSMyOrderEvalutaionModel *model = self.sourceDataArray[indexPath.row];
    XBWCSMyOrderEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XBWCSMyOrderEvaluationCell"];
    cell.imageClickBlock = ^(NSInteger index, UIView *view, NSArray *imageArray) {
        [bself post:index View:view arr:imageArray];
    };
    cell.tModel = model;
    
    
    return cell;
}
-(void)post:(NSInteger)index View:(UIView *)cont arr:(NSArray *)imageUrl{
    NSMutableArray *photoArrs = [NSMutableArray new];
    
    [imageUrl enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GKPhoto *photo        = [GKPhoto new];
        if ([obj hasPrefix:@"http"]) {
            photo.url         = [NSURL URLWithString:obj];
        }else {
            photo.image       = [UIImage imageNamed:obj];
        }
        photo.sourceImageView = cont.subviews[idx];
        [photoArrs addObject:photo];
    }];
    
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photoArrs currentIndex:index];
    //        browser.photos       = photoArrs;
    //        browser.currentIndex = index;
    browser.showStyle    = GKPhotoBrowserShowStyleZoom;
    
    [browser showFromVC:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
