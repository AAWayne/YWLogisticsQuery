//
//  YWTableHeaderView.h
//  YWLogisticsQuery
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWTableHeaderView : UIView
@property (nonatomic,strong) UIImageView *goodsPic; //商品图片(也可传入物对应流公司logo图片)
@property (nonatomic,strong) UILabel *type;         //
@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) UILabel *comLabel;
@property (strong, nonatomic) UILabel *phoneLabel;
@property (nonatomic,strong) UIImageView *psHeaderPic;
@property (nonatomic,strong) UILabel *psName;
@property (nonatomic,strong) UIButton *psPhone;
@property (copy, nonatomic)NSString *number;
@property (copy, nonatomic)NSString *company;
@property (copy, nonatomic)NSString *phone;
@end
