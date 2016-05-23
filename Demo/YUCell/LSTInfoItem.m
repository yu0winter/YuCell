//
//  LSTInfoItem.m
//  DirectorySpecification
//
//  Created by 牛玉龙 on 16/4/28.
//  Copyright © 2016年 六位时成. All rights reserved.
//

#import "LSTInfoItem.h"

@implementation LSTInfoItem
@synthesize title = _title,content = _content;
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents FontSize:(UIFont *)fontSize{
    
    NSAssert(titles.count == contents.count, @"标题数量和内容数量不匹配");
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0; i < titles.count; i ++ ) {
        LSTInfoItem *item = [[LSTInfoItem alloc] initWithTitle:titles[i] content:contents[i]];
        item.fontSize = fontSize;
        [items addObject:item];
    }
    return items;
}
+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content
{
    return [[LSTInfoItem alloc] initWithTitle:title content:content];
}
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents
{
    return [LSTInfoItem itemsWithTitles:titles Contents:contents FontSize:[UIFont systemFontOfSize:12]];
}
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content
{
    if (self = [super init]) {
        _title = title;
        _content = content;
        _fontSize = [UIFont systemFontOfSize:15];
    }
    return self;
}
@end
