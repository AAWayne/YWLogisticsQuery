//
//  YWLogisticCellModel.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YWLogisticCellModel : NSObject
@property (copy, nonatomic) NSString *dsc;
@property (copy, nonatomic) NSString *date;
@property (assign, nonatomic, readonly)CGFloat height;
@end
