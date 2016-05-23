//
//  YuCellViewModel.m
//  YuCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuCellViewModel.h"
#import "YuCellInfo.h"
#import "YuCellInfoItem.h"

@implementation YuCellViewModel

+ (YuCellInfo *)cellInfoWithModel:(NSString *)model{
    
    NSMutableArray *infoItems = [NSMutableArray array];
    
    if ([model isEqualToString:@"0"]) {
        
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"Title00000000000000000000："
                                                   content:@"000000"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"Title1："
                                                   content:@"1111111"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"Title2："
                                                   content:@"2222222"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"Title3："
                                                   content:@"3333333"]];
    }
    else if ([model isEqualToString:@"0"]) {
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"TitleA："
                                                   content:@"aaaaaaaaaaa"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"TitleB："
                                                   content:@""\
                              "BBBBBBBBBBB\n"\
                              "BBBBBBBBBBB\n"\
                              "BBBBBBBBBBB\n"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"TitleC："
                                                   content:@"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"]];
        [infoItems addObject:[YuCellInfoItem itemWithTitle:@"TitleD："
                                                   content:@"D\nDD\nDDD\nDDDD\nDDDDDDDDDDDDDDDDDDDDDD"]];
    }
    
    YuCellInfo *cellInfo = [[YuCellInfo alloc] init];
    cellInfo.infoItems = infoItems;
    cellInfo.font = [UIFont systemFontOfSize:15];
    return cellInfo;
}
@end
