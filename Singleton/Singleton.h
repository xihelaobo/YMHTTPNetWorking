//
//  Singleton.h
//
//  Created by Mac on 17-1-1.
//  Copyright (c) 2017年 yunmai. All rights reserved.
//

//单例生成类


//.h
#define single_interface(class) +(class *)shared##class;


//.m
#define  single_implementation(class)\
static class *_instance;\
+ (id)shared##class\
{\
    if(_instance == nil){\
        _instance = [[self alloc]init];\
    }\
    return _instance;\
}\
\
+ (id)allocWithZone:(NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}
