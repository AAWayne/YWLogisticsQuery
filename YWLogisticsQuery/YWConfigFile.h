//
//  YWConfigFile.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef YWConfigFile_h
#define YWConfigFile_h

#import <UIImageView+WebCache.h>
#import <Masonry.h>

#define YWScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define YWScreenHeight ([UIScreen mainScreen].bounds.size.height)

//宏定义weak
#define WeakSelf __weak typeof(self) weakSelf = self

//R G B 颜色
#define YWRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//R G B A 颜色
#define YWRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 \
alpha:(a)]

#define PLACEHOlDER_IMAGE [UIImage imageNamed:@"icon_imageLoadError"]

static CGFloat Gap = 10;
static CGFloat YW_leftSpace = 50.0;
static CGFloat YW_rightSpace = 10.0;

#endif /* YWConfigFile_h */
