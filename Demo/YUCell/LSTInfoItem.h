//
//  LSTInfoItem.h
//  DirectorySpecification
//
//  Created by 牛玉龙 on 16/4/28.
//  Copyright © 2016年 六位时成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LSTInfoItem : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, strong) UIFont *fontSize;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content;
+ (instancetype)itemWithTitle:(NSString *)title content:(NSString *)content;
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents;
+ (NSMutableArray *)itemsWithTitles:(NSArray*)titles Contents:(NSArray *)contents FontSize:(UIFont *)fontSize;
@end
