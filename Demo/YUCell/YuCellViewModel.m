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
#import "YuCellInfoItemSubOne.h"
#import "YuBasicCell.h"

typedef NS_ENUM(NSInteger,YUCellItemType){

    YUCellItemTypeA,
    YUCellItemTypeB,

};


@interface YuCellViewModel()
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSArray *itemsType;
@end
@implementation YuCellViewModel
+ (instancetype)viewModelWithData:(id)data{
    return [[self alloc] initWithData:data];
}
- (instancetype)initWithData:(id)data{

    if(self = [super init]){
        //1.保存数据
        self.data = data;
        //2.根据数据，确定信息组合。
        self.itemsType = [self itemsTypeWith:self.data];
        //3.根据组合，生成最后显示的数据。
        self.infoArray = [self infoArrayWithItemsType:self.itemsType];
        
    }
    return self;
}
- (NSArray *)itemsTypeWith:(id)data{

        return @[@(YUCellItemTypeA),
                 @(YUCellItemTypeB)];
    
}

- (NSArray <YuCellInfo *>*)infoArrayWithItemsType:(NSArray *)itemsType{
    NSMutableArray *infoArray = [NSMutableArray arrayWithCapacity:itemsType.count];
    for (NSNumber *typeNumber in itemsType) {
        YUCellItemType type = typeNumber.integerValue;
        YuCellInfo *info = [self infoWithCellItemType:type];
        if (info) [infoArray addObject:info];
    }
    return infoArray;
}

- (YuCellInfo *)infoWithIndex:(NSInteger)index{
    NSLog(@"infoWithIndex......");
    NSNumber *typeNumber = self.itemsType[index];
    YUCellItemType type = typeNumber.integerValue;
    return [self infoWithCellItemType:type];
}

- (YuCellInfo *)infoWithCellItemType:(YUCellItemType)type{

    NSMutableArray *infoItems = [NSMutableArray array];
    switch (type) {
        case YUCellItemTypeA: {
            
            YuCellInfoItem *item0 = [YuCellInfoItem itemWithTitle:@"Title00000000000000000000："
                                                          content:@"RedColor"];
            item0.contentColor = [UIColor redColor];
            
            YuCellInfoItem *item1 = [YuCellInfoItem itemWithTitle:@"Title1："
                                                          content:@"Orange"];
            item1.contentColor = [UIColor orangeColor];
            YuCellInfoItem *item2 = [YuCellInfoItem itemWithTitle:@"Title2："
                                                          content:@"Yellow"];
            item2.contentColor = [UIColor greenColor];
            YuCellInfoItem *item3 = [YuCellInfoItem itemWithTitle:@"Title3："
                                                          content:@"Green"];
            item3.contentColor = [UIColor blueColor];
            
            [infoItems addObjectsFromArray:@[item0,item1,item2,item3,]];
            break;
        }
        case YUCellItemTypeB: {
            [infoItems addObject:[YuCellInfoItem itemWithTitle:@"姓名："
                                                       content:@"          段子手😜"]];
            [infoItems addObject:[YuCellInfoItem itemWithTitle:@"生活区间："
                                                       content:@"********************\n"\
                                                                "          五湖四海\n"\
                                                                "********************"]];
            [infoItems addObject:[YuCellInfoItem itemWithTitle:@"兴趣爱好："
                                                       content:@"🏂\n🏂🏂\n🏂🏂🏂\n"\
                                                                "🏂🏂🏂🏂"]];
            [infoItems addObject:[YuCellInfoItem itemWithTitle:@"话说："
                                                       content:@"公司要求取英文名，一个女孩取了个名字叫Emma(艾玛)。不巧最近来个东北的同事，结果每次被她叫的时候，都忍不住有种揍人的冲动。"]];
            break;
        }
    }
    
    if (infoItems.count > 0) {
        YuCellInfo *cellInfo = [[YuCellInfo alloc] init];
        cellInfo.infoItems = infoItems;
        cellInfo.font = [UIFont systemFontOfSize:15];
        cellInfo.contentColor = [UIColor colorWithWhite:0 alpha:0.5];
        return cellInfo;
    }
    return nil;
}

- (NSArray <NSArray *>*)fetchDataArray {
    
    NSMutableArray *infoItems = [NSMutableArray array];
    
    NSArray *titleArray = @[@"Title00000000000000000000：",@"Title1：",@"Title2：",@"Title3："];
    
    NSArray *contentArray = @[@"RedColor",@"Orange",@"Yellow",@"Green"];
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor orangeColor],[UIColor greenColor],[UIColor blueColor]];
    

    NSMutableArray *itemArray = [NSMutableArray array];
    
    for (int i=0; i<titleArray.count; i++) {
        YuCellInfoItemSubOne *temp = [YuCellInfoItemSubOne itemWithTitle:titleArray[i] content:contentArray[i]];
        temp.contentColor = colorArray[i];
        temp.font = [UIFont systemFontOfSize:15];
        [itemArray addObject:temp];
    }
    
    [infoItems addObject:itemArray];

    
    YuCellInfoItemSubOne *item4 = [YuCellInfoItemSubOne itemWithTitle:@"姓名："
                                               content:@"          段子手😜"];
    item4.font = [UIFont systemFontOfSize:15];
    
    YuCellInfoItemSubOne *item5 = [YuCellInfoItemSubOne itemWithTitle:@"生活区间："
                                               content:@"********************\n"\
                          "          五湖四海\n"\
                          "********************"];
    item5.font = [UIFont systemFontOfSize:15];

    
    YuCellInfoItemSubOne *item6 = [YuCellInfoItemSubOne itemWithTitle:@"兴趣爱好："
                                               content:@"🏂\n🏂🏂\n🏂🏂🏂\n"\
                          "🏂🏂🏂🏂"];
    
    item6.font = [UIFont systemFontOfSize:15];

    
    YuCellInfoItemSubOne *item7 = [YuCellInfoItemSubOne itemWithTitle:@"话说："
                                               content:@"公司要求取英文名，一个女孩取了个名字叫Emma(艾玛)。不巧最近来个东北的同事，结果每次被她叫的时候，都忍不住有种揍人的冲动。"];

    item7.font = [UIFont systemFontOfSize:15];

    [infoItems addObject:@[item4,item5,item6,item7]];
 
    return infoItems;
}




@end
