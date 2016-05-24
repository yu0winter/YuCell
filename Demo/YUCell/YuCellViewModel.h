//
//  YuCellViewModel.h
//  YuCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YuCellInfo;
@interface YuCellViewModel : NSObject
@property (nonatomic, strong) NSArray<YuCellInfo *> *infoArray;
- (instancetype)initWithData:(id)data;
- (YuCellInfo *)infoWithIndex:(NSInteger)index;
+ (instancetype)viewModelWithData:(id)data;
@end
