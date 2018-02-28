//
//  YWLogisticCellModel.m
//  YWLogisticsQueryDemo
//
//  Created by Candy on 17/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "YWLogisticCellModel.h"
#import "YWConfigFile.h"

@interface YWLogisticCellModel ()

@property (assign, nonatomic)CGFloat tempHeight;
@end

@implementation YWLogisticCellModel

- (CGFloat)height {
    
    if (_tempHeight == 0) {
        
        NSDictionary * dict = [NSDictionary dictionaryWithObject: [UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
        
        CGRect rect = [self.dsc boundingRectWithSize:CGSizeMake(YWScreenWidth - YW_leftSpace - 2*YW_rightSpace, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        
        _tempHeight = rect.size.height + 50;;
    }
    
    return _tempHeight;
}
@end
