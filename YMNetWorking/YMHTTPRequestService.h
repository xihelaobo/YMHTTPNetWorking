//
//  YMHTTPRequestService.h
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/17.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "YMHTTPSessionManager.h"

@interface YMHTTPRequestService : NSObject

@property (nonatomic, strong) YMHTTPSessionManager *manager;

single_interface(YMHTTPRequestService)

- (void)postRequestUrl:(NSString *)url parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock;

- (void)getRequestUrl:(NSString *)url parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock;

@end
