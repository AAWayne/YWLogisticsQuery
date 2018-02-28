//
//  YWLogisticCell.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YWLogisticCellModel.h"
@interface YWLogisticCell : UITableViewCell

@property (assign, nonatomic) BOOL hasUpLine;
@property (assign, nonatomic) BOOL hasDownLine;
@property (assign, nonatomic) BOOL currented;

- (void)reloadDataWithModel:(YWLogisticCellModel*)model;
@end
