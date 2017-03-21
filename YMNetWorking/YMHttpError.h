//
//  YMHttpError.h
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/16.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YMHttpError : NSObject

//错误码
@property (nonatomic, assign) NSInteger errorCode;
//错误信息
@property (nonatomic, strong) NSString *errorMessage;


//网络层错误调用方法
- (instancetype)initWithHttpRequestError:(NSError *)error;

//后台报错
- (instancetype)initWithHttpRequestOperationErrorResponseObject:(id)responseObject;

@end
