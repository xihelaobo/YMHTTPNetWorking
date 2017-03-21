//
//  ViewController.m
//  AFNetWorkingTest
//
//  Created by zpf on 2017/3/15.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import "ViewController.h"
//下面的这两个头文件都可以放到.pch文件中,做全局使用,方便快捷
#import "InterFace.h"
#import "YMHTTPRequestService.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在使用的过程中可以对头文件的引入做适当的配置,方便开发(不多赘述)
    
    //请求参数拼装
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    //发起请求
    [[YMHTTPRequestService sharedYMHTTPRequestService] postRequestUrl:search parameters:parameters successBlock:^(NSURLResponse *response, id responseObject) {
        //成功回调
        NSLog(@"responseObject = %@", responseObject);
    } failureBlock:^(YMHttpError *httpError) {
        //失败回调
        NSLog(@"error = %@", httpError);
    }];
    
    //同样的道理get方法也是相同的方法(不再举例子)
    
    //当工程运行起来之后你会发现控制台会出现"error = <YMHttpError: 0x600000227040>",请不用担心,这不是代码错误,这个是接口报错,换成你们公司的接口就可以了.
}

//内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
