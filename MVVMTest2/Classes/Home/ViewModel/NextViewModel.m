//
//  NextViewModel.m
//  MVVMTest2
//
//  Created by Young on 16/4/23.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "NextViewModel.h"
#import "NetworkTool.h"
#import <MJExtension.h>
#import "NextModel.h"

@implementation NextViewModel

- (void)getDataListArray:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(NSArray *))successBlock failureBlock:(void (^)(NSError *))failureBlock {

    urlStr = @"http://test.lefen58.com/app/mall.php?c=goods/mallgood_info";
    param = @{
              @"device_index": @"53",
              @"goods_id": @"2",
              @"token": @"0"
              };
    [[NetworkTool shareManager] postDataWithUrl:urlStr param:param successBlock:^(id json) {
        NSLog(@"%@", json);
        
        NextModel *model = [NextModel mj_objectWithKeyValues:json[@"good"]];
        self.dataListM = [NSMutableArray arrayWithObject:model];
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
