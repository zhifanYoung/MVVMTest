//
//  TableDelegate.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "TableDelegate.h"
#import "BaseViewModel.h"
#import <MJRefresh.h>

@interface TableDelegate () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BaseViewModel *baseViewModel;

@property (nonatomic, copy) NSString *identifire;

@property (nonatomic, copy) TableConfigureCellBlock configureBlock;

@property (nonatomic, copy) TableCellDidSelectBlock didSelectBlock;

@property (nonatomic, copy) TableCellHeightBlock heightBlock;

@end

@implementation TableDelegate

- (void)handleTableDelegateAndDatasourece:(UITableView *)table {

    table.delegate = self;
    table.dataSource = self;
    
    __weak typeof(table)weakTable = table;
    // 开始获取数据
    [self.baseViewModel getDataList:^{
       
        [weakTable reloadData];
    } failureBlock:^{
        
    }];
    
    // 设置下拉刷新
    MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [self.baseViewModel getDataList:^{
            [weakTable reloadData];
        } failureBlock:^{
            [self.baseViewModel.dataListM removeAllObjects];
            [weakTable reloadData];
        }];
        [weakTable.mj_header endRefreshing];
    }];
    
    table.mj_header = header;
}

- (id)initWithConfigureBlock:(TableConfigureCellBlock)aCellConfigureBlock didSelectBlock:(TableCellDidSelectBlock)didSelectBlock cellHeightBlock:(TableCellHeightBlock)aCellHeigthBlock viewModel:(BaseViewModel *)viewModel identifire:(NSString *)identifire {

    if (self = [super init]) {
        
        self.baseViewModel = viewModel;
        self.identifire = identifire;
        self.sectionBlock = ^{
            return (NSInteger)1;
        };
        
        self.configureBlock = aCellConfigureBlock;
        self.didSelectBlock = didSelectBlock;
        self.heightBlock = aCellHeigthBlock;
    }
    return self;
}

#pragma mark - tableDelegate
#pragma mark - dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.sectionBlock();
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.baseViewModel.dataListM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:self.identifire];
    if (!Cell) {
        UINib *nib = [UINib nibWithNibName:self.identifire bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:self.identifire];
        Cell = [tableView dequeueReusableCellWithIdentifier:self.identifire];
    }
    
    id item = self.baseViewModel.dataListM[indexPath.row];
    
    self.configureBlock(item, indexPath, Cell);
    
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id item = self.baseViewModel.dataListM[indexPath.row];
    return self.heightBlock(item, indexPath);
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    id item = self.baseViewModel.dataListM[indexPath.row];
    
    self.didSelectBlock(item, indexPath);
}

@end

