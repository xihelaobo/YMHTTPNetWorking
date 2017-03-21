//
//  YMHTTPRequestService.m
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/17.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import "YMHTTPRequestService.h"

@implementation YMHTTPRequestService

single_implementation(YMHTTPRequestService)

- (id)init {
    if (self = [super init]) {
        _manager = [[YMHTTPSessionManager alloc] init];
    }
    return self;
}

- (void)postRequestUrl:(NSString *)url parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock {
    [_manager postRequestUrl:url parameters:parameters successBlock:successBlock failureBlock:failureBlock];
}

- (void)getRequestUrl:(NSString *)url parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock {
    [_manager getRequestUrl:url parameters:parameters successBlock:successBlock failureBlock:failureBlock];
}

@end
