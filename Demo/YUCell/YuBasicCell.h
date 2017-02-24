//
//  YuBasicCell.h
//  YuCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YuCellInfoItem.h"


@class YuCellInfo;
@interface YuBasicCell : UITableViewCell
@property (nonatomic, strong) YuCellInfo *cellInfo;

- (void)layoutByClassCellModel:(YuCellInfoItem *)infoItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath;
@end
