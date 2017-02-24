//
//  YuCellInfoItemSubOne.h
//  YUCell
//
//  Created by 牛树鹏 on 2017/2/24.
//  Copyright © 2017年 nyl. All rights reserved.
//

#import "YuCellInfoItem.h"

@interface YuCellInfoItemSubOne : YuCellInfoItem
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;


+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content;

@end
