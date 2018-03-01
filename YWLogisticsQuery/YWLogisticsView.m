//
//  YWLogisticsView.m
//  YWLogisticsQueryDemo
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YWLogisticsView.h"
#import "YWLogisticCell.h"

@interface YWLogisticsView () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic)UITableView *table;

@end

@implementation YWLogisticsView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithDataSource:(NSArray*)array {
    self = [super init];
    if (self) {
        [self.dataArray addObjectsFromArray:array];
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    if (_dataSource == dataSource) {
        _dataSource = dataSource;
    }
    [self.table reloadData];
}

- (void)setLogisticModel:(YWLogisticModel *)logisticModel {
    _logisticModel = logisticModel;
    YWTableHeaderView *header = [[YWTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, YWScreenWidth, 90)];;
    header.type.text = @"运输中";
    YWLogisticCellModel *model = self.dataArray.firstObject;
    if ([model.dsc containsString:@"已签收"]) {
        NSLog(@"快递信息中 包含 已签收 字样");
        header.type.text = @"已签收";
    }
    header.number = _logisticModel.logisticNumber;
    header.company = _logisticModel.logisticCompany;
    [header.goodsPic sd_setImageWithURL:[NSURL URLWithString:_logisticModel.goodsPicUrlStr] placeholderImage:PLACEHOlDER_IMAGE];
    
    self.table.tableHeaderView = header;
}

- (void)reloadDataWithDataSource:(NSArray *)array {
    
    [self.dataArray addObjectsFromArray:array];
    [self.table reloadData];
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)setupUI {
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self addSubview:table];
    self.table = table;
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YWLogisticCell *cell = [tableView dequeueReusableCellWithIdentifier:@"logisticsCellIdentifier"];
    if (cell == nil) {
        
        cell = [[YWLogisticCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"logisticsCellIdentifier"];
    }
    
    if (indexPath.row == 0) {
        cell.hasUpLine = NO;
        cell.currented = YES;
    } else {
        cell.hasUpLine = YES;
        cell.currented = NO;
    }
    
    if (indexPath.row == self.dataArray.count - 1) {
        cell.hasDownLine = NO;
    } else {
        cell.hasDownLine = YES;
    }
    
    YWLogisticCellModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    [cell reloadDataWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YWLogisticCellModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    return model.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 90;
}

@end
