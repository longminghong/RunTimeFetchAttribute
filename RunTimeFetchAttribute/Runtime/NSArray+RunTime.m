//
//  NSArray+RunTime.m
//  JYT
//
//  Created by longminghong on 16/4/5.
//  Copyright © 2016年 longminghong. All rights reserved.
//

#import "NSArray+RunTime.h"
#import <objc/runtime.h>

@implementation NSArray (RunTime)

+ (instancetype)getProperties:(Class)class{
    
    // 获取当前类的所有属性
    unsigned count;// 记录属性个数
    
    objc_property_t *properties = class_copyPropertyList(class, &count);
    
    // 遍历
    NSMutableArray *resultValue = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [resultValue addObject:name];
    }
    
    return resultValue.copy;
}

+ (instancetype)getAllProperties:(Class)class{
    
    // 获取当前类的所有属性
    unsigned count;// 记录属性个数
    
    NSMutableArray *resultValue = [NSMutableArray array];
    
    objc_property_t *properties = class_copyPropertyList(class, &count);
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t property = properties[i];
        
        const char *cName = property_getName(property);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [resultValue addObject:name];
    }
    
    
    Class superClass = class_getSuperclass(class);
    
    // 遍历父类
    
    if ([NSObject class] != superClass) {
        NSArray *superProperty;
        superProperty = [NSArray getAllProperties:superClass];
        [resultValue addObjectsFromArray:superProperty];
    }
    
    return resultValue.copy;
}


@end
