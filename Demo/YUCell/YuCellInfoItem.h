//
//  YuCellInfoItem.h
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YuCellInfoItem : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, strong) UIFont *font;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content;
+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content;
@end
