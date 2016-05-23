//
//  YuCellInfoItem.m
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuCellInfoItem.h"

@implementation YuCellInfoItem
@synthesize title = _title,content = _content;
+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content{
    
    return [[YuCellInfoItem alloc] initWithTitle:title content:content];
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content{
    if (self = [super init]) {
        _title = title;
        _content = content;
    }
    return self;
}
@end
