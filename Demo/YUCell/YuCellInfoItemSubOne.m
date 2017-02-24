//
//  YuCellInfoItemSubOne.m
//  YUCell
//
//  Created by 牛树鹏 on 2017/2/24.
//  Copyright © 2017年 nyl. All rights reserved.
//

#import "YuCellInfoItemSubOne.h"

@implementation YuCellInfoItemSubOne

@synthesize title = _title,content = _content;

+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content{
    
    return [[YuCellInfoItemSubOne alloc] initWithTitle:title content:content];
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content{
    if (self = [super init]) {
        _title = title;
        _content = content;
    }
    return self;
}

@end
