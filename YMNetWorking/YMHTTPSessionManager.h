//
//  YMHTTPSessionManager.h
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/15.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#define baseUrl @"https://github.com"



#import <AFNetworking/AFNetworking.h>
@class YMHttpError;

typedef void (^YMSuccessBlock)(NSURLResponse *response, id responseObject);
typedef void (^YMFailureBlock)(YMHttpError *httpError);

@interface YMHTTPSessionManager : AFHTTPSessionManager


- (void)postRequestUrl:(NSString *)urlString parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock;

- (void)getRequestUrl:(NSString *)urlString parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock;


@end
