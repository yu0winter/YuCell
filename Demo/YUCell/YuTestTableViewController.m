//
//  YuTestTableViewController.m
//  YUCell
//
//  Created by 牛玉龙 on 16/5/23.
//  Copyright © 2016年 nyl. All rights reserved.
//

#import "YuTestTableViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "YuBasicCell.h"
#import "YuCellViewModel.h"
#import "Masonry.h"

@interface YuTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YuCellViewModel *viewModel;
@end

@implementation YuTestTableViewController
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    self.viewModel = [YuCellViewModel viewModelWithData:@"any model depends on you."];
    [self setupSubViews];
    [self layoutPageSubViews];
}
- (void)setupSubViews{
    //初始化并添加自视图
    [self.view addSubview:self.tableView];
}
- (void)layoutPageSubViews{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //设置页面子视图布局
}
#pragma mark - Event Response 事件响应
#pragma mark - Delegate Realization 实现委托方法
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.viewModel.infoArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YuBasicCell *cell = [YuBasicCell  cellWithTableView:tableView];
    cell.cellInfo = [self.viewModel infoWithIndex: indexPath.section];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = NSStringFromClass( [YuBasicCell class]);
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(YuBasicCell *cell) {
        cell.cellInfo = [self.viewModel infoWithIndex: indexPath.section];
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark - Custom Accessors 自定义属性
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[YuBasicCell class] forCellReuseIdentifier:NSStringFromClass([YuBasicCell class])];
    _tableView = tableView;
    return _tableView;
}
#pragma mark - Custom Method    自定义方法
@end
