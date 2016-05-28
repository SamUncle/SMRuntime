//
//  NSObject+item.h
//  SMRuntime
//
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional
// 提供一个协议，只要准备这个协议的类，都能把数组中的字典转模型
//用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (item)
+(instancetype)objectWithDictionary:(NSDictionary *)dictionary;
@end
