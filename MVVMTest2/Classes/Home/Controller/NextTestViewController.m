//
//  NextTestViewController.m
//  MVVMTest2
//
//  Created by Young on 16/4/23.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "NextTestViewController.h"
#import "TableDelegate.h"
#import "UITableViewCell+Extension.h"
#import "NextViewModel.h"

@interface NextTestViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (nonatomic, strong) TableDelegate *tableDelegate;

@end

static NSString *const NextCellId = @"NextCell";

@implementation NextTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTable];
    NSLog(@"%s -- %@", __func__, self.goods_id);
}

- (void)setupTable {
    
    TableConfigureCellBlock configureBlock = ^(id item, NSIndexPath *indexPath, UITableViewCell *cell) {
        [cell configureCell:item indexPath:indexPath];
    };
    
    TableCellDidSelectBlock didSelectBlock = ^(id item, NSIndexPath *indexPath) {
    
        NSLog(@"%s", __func__);
    };
    
    TableCellHeightBlock heigthBlock = ^(id item, NSIndexPath *indexPath) {
        return (CGFloat)120;
    };
    self.tableDelegate = [[TableDelegate alloc] initWithConfigureBlock:configureBlock didSelectBlock:didSelectBlock cellHeightBlock:heigthBlock viewModel:[[NextViewModel alloc] init] identifire:NextCellId];
    [self.tableDelegate handleTableDelegateAndDatasourece:self.mainTable];
}

@end

