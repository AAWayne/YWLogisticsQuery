//
//  YWLogisticsView.h
//  YWLogisticsInformation
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YWTableHeaderView.h"
@interface YWLogisticsView : UIView

@property (nonatomic, strong) NSArray                   * datas;
@property (nonatomic, strong) YWTableHeaderView         * header ;
@property (nonatomic, strong) NSDictionary              * expressDic;
@property (nonatomic, strong) NSString                  * filrUrl;  // 文件服务器地址,如 http://www.baidu.com


- (instancetype)initWithDatas:(NSArray*)array;
- (void)reloadDataWithDatas:(NSArray *)array;

@end
