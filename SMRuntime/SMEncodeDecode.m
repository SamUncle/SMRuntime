//
//  SMEncodeDecode.m
//  SMRuntime
//
//  Created by SmileSun on 16-5-28.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMEncodeDecode.h"
#import <objc/runtime.h>
@implementation SMEncodeDecode
/***************宏定义*************/
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    encodeRuntime(SMEncodeDecode);
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    initCodeRuntime(SMEncodeDecode);
}
#pragma mark --用runtime归档解档
/*
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    Ivar * ivars = class_copyIvarList([SMEncodeDecode class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = ivars[i];
        const char * name = ivar_getName(var);
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned int count;
        Ivar * ivars = class_copyIvarList([SMEncodeDecode class], &count);
        for (int i = 0; i < count; i++) {
            Ivar var = ivars[i];
            const char * name = ivar_getName(var);
            NSString * key = [NSString stringWithUTF8String:name];
           id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    
    return self;
}
 */

#pragma mark --最原始方法
/**  最原始方法(麻烦---若有100个属性这样设是不是觉得累?)
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_first forKey:@"first"];
    [aCoder encodeObject:_second forKey:@"second"];
    [aCoder encodeObject:_third forKey:@"third"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.first = [aDecoder decodeObjectForKey:@"first"];
        self.second = [aDecoder decodeObjectForKey:@"second"];
        self.third = [aDecoder decodeObjectForKey:@"third"];
    }
    return self;
}
**/
@end
