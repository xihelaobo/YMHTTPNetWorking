# YMHTTPNetWorking
基于AFNetWorking的二次封装,通过单例的方式开放方法,方便快捷.

使用方法:
1.既然是基于AFNetWorking的二次封装,第一步首先是要导入AFNetWorking三方库,指定版本3.X,手动导入或者用cocoaPods都可以.
```
platform :ios, '8.0'

target 'AFNetWorkingTest' do
pod 'AFNetworking', '~> 3.0'
end
```
2.第二步
