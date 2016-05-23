//
//  YuCell.h
//  YuCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YuCellInfo;
@interface YuCell : UITableViewCell
@property (nonatomic, strong) YuCellInfo *cellInfo;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
