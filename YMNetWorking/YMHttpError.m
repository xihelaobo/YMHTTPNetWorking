//
//  YMHttpError.m
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/16.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import "YMHttpError.h"

@interface YMHttpError ()



@end

@implementation YMHttpError

//网络层错误调用方法
- (instancetype)initWithHttpRequestError:(NSError *)error {
    if (self = [super init]) {
        
        NSString *errorMessageString;
        
        switch (error.code) {
            case NSURLErrorTimedOut:
                errorMessageString = @"请求超时,请检查您的网络";//网络超时
                break;
            case NSURLErrorCancelled:
                errorMessageString = @"请求中断,请检查您的网络";//请求中断
                break;
            case NSURLErrorNotConnectedToInternet:
                errorMessageString = @"网络无法连接,请检查您的网络";//无法连接网络
                break;
                
            default:
                errorMessageString = @"未知网络错误";
                break;
        }
        
        self.errorCode = error.code;
        self.errorMessage = errorMessageString;
    }
    return self;
}

//后台报错
- (instancetype)initWithHttpRequestOperationErrorResponseObject:(id)responseObject {
    if (self = [super init]) {
        self.errorMessage = [responseObject valueForKey:@"message"];
        self.errorCode = [[responseObject valueForKey:@"errCode"] integerValue];
    }
    return self;
}

@end
