//
//  YWImageCache.h
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/3/5.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^YWImageBlock)(UIImage *image);

@interface YWImageCache : NSObject

@property (nonatomic, copy) NSString * imageUrl;
@property (nonatomic, copy) YWImageBlock imageBlock;

//开始下载图像
- (void)startCacheImage:(NSString *)imageUrl;

//从本地加载图像
- (UIImage *)loadLocalImage:(NSString *)imageUrl;

@end
