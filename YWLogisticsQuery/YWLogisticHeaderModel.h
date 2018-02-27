//
//  YWLogisticHeaderModel.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/2/27.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWLogisticHeaderModel : NSObject

@property (copy, nonatomic) NSString *logisticCode;         // 物流编码（快递码，用于辨别对应的快递公司）
@property (copy, nonatomic) NSString *logisticNumber;       // 物流单号（快递单号）
@property (copy, nonatomic) NSString *logisticCompany;      // 物流公司
@property (copy, nonatomic) NSString *goodsPicUrlStr;       // 物流公司Logo(也可传入对应商品图片)完整链接

@end
