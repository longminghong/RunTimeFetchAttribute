//
//  NSArray+RunTime.h
//  JYT
//
//  Created by longminghong on 16/4/5.
//  Copyright © 2016年 longminghong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RunTime)

+ (instancetype)getProperties:(Class)class;

+ (instancetype)getAllProperties:(Class)class;
@end
