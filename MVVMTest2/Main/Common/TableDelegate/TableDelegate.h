//
//  TableDelegate.h
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BaseViewModel;

typedef void(^TableConfigureCellBlock)(id item, NSIndexPath *indexPath, UITableViewCell *cell);

typedef void(^TableCellDidSelectBlock)(id item, NSIndexPath *indexPath);

typedef CGFloat(^TableCellHeightBlock)(id item, NSIndexPath *indexPath);

typedef NSInteger(^TableSectionsBlock)();

@interface TableDelegate : NSObject

@property (nonatomic, copy) TableSectionsBlock sectionBlock;

- (id)initWithConfigureBlock:(TableConfigureCellBlock)aCellConfigureBlock didSelectBlock:(TableCellDidSelectBlock)didSelectBlock cellHeightBlock:(TableCellHeightBlock)aCellHeigthBlock viewModel:(BaseViewModel *)viewModel identifire:(NSString *)identifire;

- (void)handleTableDelegateAndDatasourece:(UITableView *)table;

@end
