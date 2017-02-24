//
//  YuBasicCell.m
//  YuCell
//
//  Created by 牛玉龙 on 16/5/20.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuBasicCell.h"
#import "YuCellInfo.h"
#import "YuCellInfoItem.h"
#import "YuCellInfoItemSubOne.h"
#import "Masonry.h"

#define SCREEN_WIDTH (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? [[UIScreen mainScreen] bounds].size.width : 1024)
#define SCREEN_HEIGHT (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? ([[UIScreen mainScreen] bounds].size.height) : 748)
#define MAX_TITLE_LENGTH (SCREEN_WIDTH/2.0-MARGIN-PADDING)
#define PADDING 10
#define MARGIN 20
#define SCALE 3

@interface YuBasicCell()

@property (nonatomic, strong) NSMutableArray<UILabel *> *titleLabels;
@property (nonatomic, strong) NSMutableArray<UILabel *> *detailLabels;
@end
@implementation YuBasicCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *ID = NSStringFromClass([YuBasicCell class]);
    
    YuBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        
        cell = [[YuBasicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath {
    YuBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    return cell;
}


- (void)layoutByClassCellModel:(YuCellInfoItem *)infoItem {
    
    NSArray *subviews = self.contentView.subviews;
    [subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];

    
    if ([infoItem isKindOfClass:[YuCellInfoItemSubOne class]]) {
        
        UILabel *title = [UILabel new];
        title.font = infoItem.font?:[UIFont systemFontOfSize:12];
        title.text = infoItem.title;
        title.textColor = infoItem.titleColor?:[UIColor blackColor];
        title.numberOfLines = 0;
        [self.contentView addSubview:title];
        
        UILabel *content = [UILabel new];
        content.textAlignment = NSTextAlignmentLeft;
        content.font = infoItem.font?:[UIFont systemFontOfSize:12];
        content.text = infoItem.content;
        content.textColor = infoItem.contentColor?:[UIColor grayColor];
        content.numberOfLines = 0;
        [self.contentView addSubview:content];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(MARGIN).key(@"titlt-left");
            make.top.equalTo(self.contentView).offset(PADDING).key(@"titlt-Top");
            make.right.equalTo(content.mas_left).offset(-PADDING).key(@"titlt-right");
            
            if ([self widthWithText:title.text Font:title.font] + MARGIN + PADDING > SCREEN_WIDTH/3.0) {
                make.width.equalTo(content).dividedBy(2).key(@"titlt-height");
            }else {
                make.width.equalTo(content).dividedBy(3).key(@"titlt-height");

            }
            make.bottom.lessThanOrEqualTo(self.contentView).offset(-MARGIN).key(@"titlt-bottom");
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(PADDING).key(@"content-top");
            make.right.equalTo(self.contentView).offset(-MARGIN).key(@"content-right");
            make.bottom.lessThanOrEqualTo(self.contentView).offset(-PADDING).key(@"content-bottom");
        }];
    }
}


- (void)setCellInfo:(YuCellInfo *)cellInfo{
    _cellInfo = cellInfo;

    [self setupSubViews];
}

- (void)setupSubViews{
    
    NSArray *subviews = self.contentView.subviews;
    [subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    NSArray *infoItems = self.cellInfo.infoItems;
    
    self.titleLabels = [NSMutableArray arrayWithCapacity:infoItems.count];
    self.detailLabels = [NSMutableArray arrayWithCapacity:infoItems.count];
    CGFloat contentLeading = [self contentLeadingWithInfoItems:infoItems];
    
    UIView *lastView;
    
    for (NSInteger i = 0; i < infoItems.count; i++) {
        YuCellInfoItem *item = infoItems[i];
        UILabel *title = [UILabel new];
        title.font = item.font?:[UIFont systemFontOfSize:12];
        title.text = item.title;
        title.textColor = item.titleColor?:[UIColor blackColor];
        title.numberOfLines = 0;
        [title setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.titleLabels addObject:title];
        [self.contentView addSubview:title];
        
        UILabel *content = [UILabel new];
        content.textAlignment = NSTextAlignmentLeft;
        content.font = item.font?:[UIFont systemFontOfSize:12];
        content.text = item.content;
        content.textColor = item.contentColor?:[UIColor grayColor];
        content.numberOfLines = 0;
        [self.detailLabels addObject:content];
        [self.contentView addSubview:content];

        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView ==nil) {
                make.left.top.equalTo(self.contentView).offset(20);
            }else {
                make.top.equalTo(lastView.mas_bottom).offset(10);
                make.left.equalTo(self.contentView).offset(20);
            }
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView ==nil) {
                make.top.equalTo(self.contentView).offset(20);
            }else {
                make.top.equalTo(lastView.mas_bottom).offset(10);
            }
            if ([self widthWithText:title.text Font:title.font] > MAX_TITLE_LENGTH) {
                make.left.equalTo(title.mas_right).offset(10);
            }else{
                make.left.equalTo(self.contentView).offset(contentLeading);
            }
            make.right.equalTo(self.contentView).offset(-20);
            make.height.greaterThanOrEqualTo(title);
            if (i == infoItems.count-1) {
                make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
            }
        }];
        lastView = content;
    }
}

- (CGFloat)contentLeadingWithInfoItems:(NSArray <YuCellInfoItem *> *)items{

    CGFloat targetLeading = 0.0 ;
    CGFloat limitLeading = MAX_TITLE_LENGTH;
    for (YuCellInfoItem *item in items) {
        NSString *str = item.title;
        CGFloat width = [self widthWithText:str Font:item.font];
        if(width > targetLeading && width < limitLeading){
            targetLeading = width;
        }
    }
    return MARGIN + targetLeading + PADDING;
}

- (CGFloat)widthWithText:(NSString *)text Font:(UIFont *)font{
    if (text.length) {
        NSDictionary *attrs = @{NSFontAttributeName : font};
        CGSize size = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    }
    return 0;
}


@end
