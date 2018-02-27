//
//  YWLogisticsView.h
//  YWLogisticsInformation
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YWTableHeaderView.h"
#import "YWLogisticHeaderModel.h"
#import "YWLogisticModel.h"
#import "YWConfigFile.h"

@interface YWLogisticsView : UIView

@property (nonatomic, strong) NSArray                   * datas;

@property (nonatomic, strong) NSDictionary              * expressDic;
@property (nonatomic, strong) YWLogisticHeaderModel     * headerModel;

- (instancetype)initWithDatas:(NSArray*)array;
- (void)reloadDataWithDatas:(NSArray *)array;

@end
