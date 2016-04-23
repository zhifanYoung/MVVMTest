//
//  TestCell.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "TestCell.h"
#import "TestModel.h"
#import <UIImageView+WebCache.h>

@implementation TestCell

-(void)configureCell:(id)item indexPath:(NSIndexPath *)indexPath {

    TestModel *model = (TestModel *)item;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lefenmall.net/%@", model.goods_icon]]];
    self.titleLabel.text = model.goods_name;
}

@end
