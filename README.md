# YMHTTPNetWorking
基于AFNetWorking的二次封装,通过单例的方式开放方法,方便快捷.

使用方法:

1.既然是基于AFNetWorking的二次封装,第一步首先是要导入AFNetWorking三方库,指定版本3.X,手动导入或者用cocoaPods都可以.
使用cocoaPods导入
```
platform :ios, '8.0'

target 'AFNetWorkingTest' do
pod 'AFNetworking', '~> 3.0'
end
```
2.需要在你的Info.plist文件中添加配置
```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```
3.将YMNetWorking文件夹下的文件拷贝出来
4.将Singleton文件夹下的文件拷贝出来
5.导入项目
6.调用方法(同样的道理get方法也是相同的方法(不再举例子)详情请见demo)
```
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
```
