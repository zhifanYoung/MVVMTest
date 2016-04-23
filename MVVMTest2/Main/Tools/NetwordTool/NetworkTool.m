//
//  NetworkTool.m
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import "NetworkTool.h"
#import <MBProgressHUD.h>
static NetworkTool *tool;

@implementation NetworkTool

+ (instancetype)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
        tool = [[self alloc] initWithBaseURL:[NSURL URLWithString:@""] sessionConfiguration:configure];
        tool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        [tool.requestSerializer setTimeoutInterval:30];
        [tool.reachabilityManager startMonitoring];
    });
    return tool;
}

- (void)getDataWithUrl:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(id))successBlock failureBlock:(void (^)(NSError *))failureBlock {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    hud.graceTime = 0.5;
    hud.taskInProgress = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud show:YES];
    
    [self GET:urlStr parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [hud removeFromSuperview];
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [hud removeFromSuperview];
        
        MBProgressHUD *errorHud = [[MBProgressHUD alloc] init];
        errorHud.labelText = @"网络出错";
        [[UIApplication sharedApplication].keyWindow addSubview:errorHud];
        [errorHud show:YES];
        [errorHud hide:YES afterDelay:1.0];
        
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

- (void)postDataWithUrl:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void (^)(id))successBlock failureBlock:(void (^)(NSError *))failureBlock {

    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    hud.graceTime = 0.5;
    hud.taskInProgress = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud show:YES];
    
    [self POST:urlStr parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [hud removeFromSuperview];
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [hud removeFromSuperview];
        
        MBProgressHUD *errorHud = [[MBProgressHUD alloc] init];
        errorHud.labelText = @"网络出错";
        [[UIApplication sharedApplication].keyWindow addSubview:errorHud];
        [errorHud show:YES];
        [errorHud hide:YES afterDelay:1.0];

        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end

