//
//  YuCellInfo.h
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class YuCellInfoItem;
@interface YuCellInfo : NSObject
@property (nonatomic, strong) UIFont  *font;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *contentColor;
@property (nonatomic, strong) NSMutableArray <YuCellInfoItem *> *infoItems;

+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents;
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents FontSize:(UIFont *)fontSize;
@end
