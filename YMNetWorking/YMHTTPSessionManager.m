//
//  YMHTTPSessionManager.m
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/15.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import "YMHTTPSessionManager.h"
#import "YMHttpError.h"

@interface YMHTTPSessionManager ()



@end

@implementation YMHTTPSessionManager

- (void)postRequestUrl:(NSString *)urlString parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock {
    
    NSError *serializationError = nil;
    
    //构造请求
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:urlString relativeToURL:[NSURL URLWithString:baseUrl]] absoluteString] parameters:parameters error:&serializationError];
    
    NSURLSessionDataTask *dataTask = [self httpRequest:request successBlock:successBlock failureBlock:failureBlock];
    
    [dataTask resume];
}

- (void)getRequestUrl:(NSString *)urlString parameters:(id)parameters successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock {
    
    NSError *serializationError = nil;
    
    //构造请求
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:urlString relativeToURL:[NSURL URLWithString:baseUrl]] absoluteString] parameters:parameters error:&serializationError];
    
    NSURLSessionDataTask *dataTask = [self httpRequest:request successBlock:successBlock failureBlock:failureBlock];
    
    [dataTask resume];
}

- (NSURLSessionDataTask *)httpRequest:(NSMutableURLRequest *)request successBlock:(YMSuccessBlock)successBlock failureBlock:(YMFailureBlock)failureBlock {
    //设置请求超时时间
    self.requestSerializer.timeoutInterval = 15;
    //设置数据接收类型
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"text/plain", nil];
    //设置请求头等配置(根据需求自行设置)
    
    [request setValue:@"Ent" forHTTPHeaderField:@"ClientType"];
    [request setValue:@"IOS" forHTTPHeaderField:@"ClientSystem"];
    [request setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forHTTPHeaderField:@"Equipment"];
    
    //执行请求
    NSURLSessionDataTask *dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            //网络层的错误处理
            if (failureBlock) {
                failureBlock([[YMHttpError alloc] initWithHttpRequestError:error]);
            }
            
        }else{
            //请求调用成功(可以进行下一步的整体的业务逻辑的操作)
            if ([responseObject[@"suc"] isEqual:@(1)]) {
                //如果请求成功
                
                if (successBlock) {
                    successBlock(response, responseObject);
                }
                
            }else{
                //如果请求业务报错
                YMHttpError *ymHttpError = [[YMHttpError alloc] initWithHttpRequestOperationErrorResponseObject:responseObject];
                //对一些统一的特殊的业务错误进行处理(例如异地登录)
                if (ymHttpError.errorCode == 5006) {
                    
                    
                    
                    
                    
                    
                    
                }else if (ymHttpError.errorCode == 5007) {
                    
                    
                    
                    
                    
                    
                    
                    
                }else{
                    failureBlock(ymHttpError);
                }
            }
        }
    }];
    
    return dataTask;
}

@end
