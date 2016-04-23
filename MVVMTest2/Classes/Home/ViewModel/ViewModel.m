//
//  ViewModel.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "ViewModel.h"
#import "TestModel.h"
#import "NetworkTool.h"
#import <MJExtension.h>

@implementation ViewModel

- (void)getDataListArray:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(NSArray *))successBlock failureBlock:(void (^)(NSError *))failureBlock {

    // 发送数据请求
    //test.lefen58.com/app/mall.php?c=goods/mallgoods_class&class=2&comprehensive=0&device_index=51&goods_type=0&page=0&price=0&sales=0&token=225489160447791935

    urlStr = @"http://test.lefen58.com/app/mall.php?c=goods/mallgoods_class";
    param = @{
              @"class": @"2",
              @"comprehensive":@"0",
              @"device_index": @"51",
              @"goods_type": @"0",
              @"page": @"0",
              @"price": @"0",
              @"sales": @"0",
              @"token": @"225489160447791935"
              };
    
    [[NetworkTool shareManager] postDataWithUrl:urlStr param:param successBlock:^(id json) {
        NSLog(@"%@", json);
        self.dataListM = [TestModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        if (successBlock) {
            successBlock(self.dataListM);
        }
    } failureBlock:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
}

@end
