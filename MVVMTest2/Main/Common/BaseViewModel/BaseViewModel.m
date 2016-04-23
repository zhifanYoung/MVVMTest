
//
//  BaseViewModel.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)getDataListArray:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(NSArray *))successBlock failureBlock:(void (^)(NSError *))failureBlock {

    if (successBlock) {
        successBlock(self.dataListM);
    }
    if (failureBlock) {
        failureBlock(nil);
    }
}

- (void)getDataList:(void (^)())successBlock failureBlock:(void (^)())failureBlock {

    [self getDataListArray:nil param:nil successBlock:^(NSArray *array) {
       
        if (successBlock) {
            successBlock();
        }
    } failureBlock:^(NSError *error) {
        
        if (failureBlock) {
            failureBlock();
        }
    }];
}

- (NSMutableArray *)dataListM {

    if (!_dataListM) {
        _dataListM = [NSMutableArray array];
    }
    return _dataListM;
}

@end
