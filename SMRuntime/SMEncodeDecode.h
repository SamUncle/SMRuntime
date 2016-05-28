//
//  SMEncodeDecode.h
//  SMRuntime
//
//  Created by SmileSun on 16-5-28.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>
#define encodeRuntime(A)\
\
unsigned int count;\
Ivar * ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i < count; i++) {\
    Ivar var = ivars[i];\
    const char * name = ivar_getName(var);\
    NSString * key = [NSString stringWithUTF8String:name];\
    id value = [self valueForKey:key];\
    [aCoder encodeObject:value forKey:key];\
}\
free(ivars);

#define initCodeRuntime(A)\
\
self = [super init];\
if (self) {\
    unsigned int count;\
    Ivar * ivars = class_copyIvarList([SMEncodeDecode class], &count);\
    for (int i = 0; i < count; i++) {\
        Ivar var = ivars[i];\
        const char * name = ivar_getName(var);\
        NSString * key = [NSString stringWithUTF8String:name];\
        id value = [aDecoder decodeObjectForKey:key];\
        [self setValue:value forKey:key];\
    }\
    free(ivars);\
}\
\
return self;

@interface SMEncodeDecode : NSObject<NSCoding>
@property (nonatomic, copy) NSString *first;
@property (nonatomic, copy) NSString *second;
@property (nonatomic, copy) NSString *third;
@end
