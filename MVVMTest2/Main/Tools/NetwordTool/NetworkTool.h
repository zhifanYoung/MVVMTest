//
//  NetworkTool.h
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTool : AFHTTPSessionManager

+ (instancetype)shareManager;

- (void)getDataWithUrl:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(id json))successBlock failureBlock:(void (^)(NSError *error))failureBlock;

- (void)postDataWithUrl:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(id json))successBlock failureBlock:(void (^)(NSError *error))failureBlock;


@end
