//
//  LogisticsQueryViewController.m
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/2/27.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import "LogisticsQueryViewController.h"
#import <AFNetworking.h>

@interface LogisticsQueryViewController ()

@property (nonatomic, strong) NSMutableArray         * dataSource;
@property (nonatomic, strong) NSMutableArray         * contextArray;
@property (nonatomic, strong) NSMutableArray         * timeArray;

- (void)initUserInterface;  /**< 初始化用户界面 */
- (void)initUserDataSource;  /**< 初始化数据源 */

@end

@implementation LogisticsQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"物流信息";
    [self initUserInterface];
    [self initUserDataSource];
    
}

- (void)initUserDataSource {
    WeakSelf;
    _dataSource = [NSMutableArray array];
    
    // 快递100 帮助文档 - https://www.kuaidi100.com/openapi/api_post.shtml
    NSString *queryUrl = [NSString stringWithFormat:@"https://m.kuaidi100.com/query?type=%@&postid=%@",
                          _model.logisticCode,
                          _model.logisticNumber
                          ];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"text/javascript", @"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 15.0;
    [manager POST:queryUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject:\n%@", responseObject);
        if ([responseObject allKeys].count > 0) {
            if ([responseObject[@"status"] integerValue] == 200) {
                NSArray *expressArr = responseObject[@"data"];
                for (NSDictionary *express in expressArr) {
                    YWLogisticCellModel *model = [[YWLogisticCellModel alloc]init];
                    model.dsc = express[@"context"];
                    model.date = express[@"time"];
                    [_dataSource addObject:model];
                }
            }
        }
        [weakSelf initUserInterface];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"物流信息加载失败,请稍后重试");
        
    }];
    
}

- (void)initUserInterface {
    YWLogisticsView *logis = [[YWLogisticsView alloc] initWithDataSource:_dataSource];
    logis.frame = CGRectMake(0, 0, YWScreenWidth, YWScreenHeight);
    logis.logisticModel = _model;
    [self.view addSubview:logis];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

