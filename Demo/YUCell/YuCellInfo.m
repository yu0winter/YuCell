//
//  YuCellInfo.m
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuCellInfo.h"
#import "YuCellInfoItem.h"

@implementation YuCellInfo
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents FontSize:(UIFont *)fontSize{
    
    NSAssert(titles.count == contents.count, @"标题数量和内容数量不匹配");
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0; i < titles.count; i ++ ) {
        YuCellInfoItem *item = [[YuCellInfoItem alloc] initWithTitle:titles[i] content:contents[i]];
        [items addObject:item];
    }
    return items;
}
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents{
    
    return [YuCellInfo itemsWithTitles:titles Contents:contents FontSize:[UIFont systemFontOfSize:15]];
}

- (void)setFont:(UIFont *)font{
    for (YuCellInfoItem *item in self.infoItems) {
        if (!item.font) {
            item.font = font;
        }
    }
}
- (void)setTitleColor:(UIColor *)titleColor{
    for (YuCellInfoItem *item in self.infoItems) {
        if (!item.titleColor) {
            item.titleColor = titleColor;
        }
    }
}
- (void)setContentColor:(UIColor *)contentColor{
    for (YuCellInfoItem *item in self.infoItems) {
        if (!item.contentColor) {
            item.contentColor = contentColor;
        }
    }
}
@end
