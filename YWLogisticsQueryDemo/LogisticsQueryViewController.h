//
//  LogisticsQueryViewController.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/2/27.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YWLogisticsView.h"

@interface LogisticsQueryViewController : UIViewController

@property (nonatomic, strong) YWLogisticModel  * model; // 包括：物流信息（编码、单号、物流公司、商品图片或物流公司logo）

@end
