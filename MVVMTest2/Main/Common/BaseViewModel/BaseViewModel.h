//
//  BaseViewModel.h
//  MVVMTest2
//
//  Created by Young on 16/4/22.
//  Copyright © 2016年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataListM;

- (void)getDataListArray:(NSString *)urlStr param:(NSDictionary *)param successBlock:(void(^)(NSArray *))successBlock failureBlock:(void(^)(NSError *error))failureBlock;

- (void)getDataList:(void(^)())successBlock failureBlock:(void(^)())failureBlock;
@end
