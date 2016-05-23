//
//  YuTestTableViewController.m
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuTestTableViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "YuCell.h"
#import "YuCellViewModel.h"


#define SCREEN_WIDTH (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? [[UIScreen mainScreen] bounds].size.width : 1024)
#define SCREEN_HEIGHT (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? ([[UIScreen mainScreen] bounds].size.height) : 748)

@interface YuTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YuTestTableViewController
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupSubViews];
    [self layoutPageSubViews];
}
- (void)setupSubViews{
    //初始化并添加自视图
    [self.view addSubview:self.tableView];
}
- (void)layoutPageSubViews{
    //设置页面子视图布局
}
#pragma mark - Event Response 事件响应
#pragma mark - Delegate Realization 实现委托方法
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YuCell *cell = [YuCell  cellWithTableView:tableView];
    cell.cellInfo = [YuCellViewModel cellInfoWithModel:@"test"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = NSStringFromClass( [YuCell class]);
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(YuCell *cell) {
        cell.cellInfo = [YuCellViewModel cellInfoWithModel:@"test"];
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark - Custom Accessors 自定义属性
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[YuCell class] forCellReuseIdentifier:NSStringFromClass([YuCell class])];
    _tableView = tableView;
    return _tableView;
}
#pragma mark - Custom Method    自定义方法
@end
