//
//  ViewController.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "ViewController.h"
#import "TableDelegate.h"
#import "ViewModel.h"
#import "TestCell.h"
#import "NextTestViewController.h"
#import "TestModel.h"
#import "UITableViewCell+Extension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (nonatomic, strong) TableDelegate *tableDelegate;

@end

static NSString *const TestCellId = @"TestCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTable];
}

- (void)setupTable {

    TableConfigureCellBlock configureBlock = ^(id item, NSIndexPath *indexPath, UITableViewCell *cell) {
        
        [(TestCell *)cell configureCell:item indexPath:indexPath];
    };
    
    TableCellDidSelectBlock didSelectBlock = ^(id item, NSIndexPath *indexPath) {
    
        [self.mainTable deselectRowAtIndexPath:indexPath animated:YES];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"NextTest" bundle:nil];
        NextTestViewController *nextVc = [sb instantiateInitialViewController];
        nextVc.goods_id = [(TestModel *)item goods_id];
        [self.navigationController pushViewController:nextVc animated:YES];
    };
    
    TableCellHeightBlock heightBlock = ^ (id item, NSIndexPath *indexPath){
    
        return (CGFloat)120;
    };
    
    self.tableDelegate = [[TableDelegate alloc] initWithConfigureBlock:configureBlock didSelectBlock:didSelectBlock cellHeightBlock:heightBlock viewModel:[[ViewModel alloc] init] identifire:TestCellId];
    
    [self.tableDelegate handleTableDelegateAndDatasourece:self.mainTable];
    
}


@end
