//
//  YWImageCache.m
//  YWLogisticsQueryDemo
//
//  Created by Candy on 2018/3/5.
//  Copyright © 2018年 com.scsskc. All rights reserved.
//

#import "YWImageCache.h"
#import "YWConfigFile.h"
@implementation YWImageCache

- (void)dealloc {
    
    self.imageUrl = nil;
}

#pragma mark - 异步加载
- (void)startCacheImage:(NSString *)imageUrl
{
    WeakSelf;
    self.imageUrl = imageUrl;
    
    // 先判断本地沙盒是否已经存在图像，存在直接获取，不存在再下载，下载后保存
    // 存在沙盒的Caches的子文件夹CacheImages中
    __block UIImage * image = [self loadLocalImage:imageUrl];
    
    if (image == nil) {
        // 沙盒中没有，下载
        // 异步下载,分配在程序进程缺省产生的并发队列
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            // 多线程中下载图像--->方便简洁写法
            NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            
            // 缓存图片
            [imageData writeToFile:[self imageFilePath:imageUrl] atomically:YES];
            image = [UIImage imageWithData:imageData];
            // 利用blcok,将image对象回调
            if (weakSelf.imageBlock) {
                weakSelf.imageBlock(image);
            }
        });
    } else {
        if (_imageBlock) {
            _imageBlock(image);
        }
    }
    
}


#pragma mark - 加载本地图像
- (UIImage *)loadLocalImage:(NSString *)imageUrl
{
    
    self.imageUrl = imageUrl;
    
    // 获取图像路径
    NSString * filePath = [self imageFilePath:self.imageUrl];
    
    UIImage * image = [UIImage imageWithContentsOfFile:filePath];
    
    if (image != nil) {
        return image;
    }
    
    return nil;
    
}

#pragma mark - 获取图像路径
- (NSString *)imageFilePath:(NSString *)imageUrl
{
    // 获取caches文件夹路径
    NSString * cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"cachesPath = %@", cachesPath);
    // 创建CacheImages文件夹
    NSString * CacheImagesPath = [cachesPath stringByAppendingPathComponent:@"CacheImages"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:CacheImagesPath]) {
        
        [fileManager createDirectoryAtPath:CacheImagesPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
#pragma mark 拼接图像文件在沙盒中的路径,因为图像URL有"/",要在存入前替换掉,随意用"_"代替
    NSString * imageName = [imageUrl stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString * imageFilePath = [CacheImagesPath stringByAppendingPathComponent:imageName];
    
    return imageFilePath;
}

@end

