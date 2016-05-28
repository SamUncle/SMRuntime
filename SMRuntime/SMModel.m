//
//  SMModel.m
//  SMRuntime
//  本文参考网址http://www.code4app.com/forum.php?mod=viewthread&tid=8241&extra=page%3D11%26filter%3Dsortid%26sortid%3D1
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMModel.h"
#import "NSObject+item.h"
@implementation SMModel

//[self setValuesForKeysWithDictionary:dic];也就是对系统KVC的实现,下面的方法实现和kvc非常类似,可以说就是一样的
+(instancetype)initWithDictionary:(NSDictionary *)dic
{
    return (SMModel*)[self objectWithDictionary:dic];
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@",_chinese,_english];
}
@end
