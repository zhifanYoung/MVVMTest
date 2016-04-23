//
//  NextCell.m
//  MVVMTest2
//
//  Created by Young on 16/4/23.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "NextCell.h"
#import "NextModel.h"

@implementation NextCell

- (void)configureCell:(id)item indexPath:(NSIndexPath *)indexPath {

    self.nameLabel.text = [(NextModel *)item goods_name];
}

@end
