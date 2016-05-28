//
//  SMTool.m
//  SMRuntime
//
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMTool.h"

@implementation SMTool
+(instancetype)SMShareManager
{
    static SMTool * _tool;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _tool = [[SMTool alloc]init];
    });
    return _tool;
}
-(NSString *)changeMethod
{
    return @"已经替换了你的方法啦O(∩_∩)O哈哈~";
}
-(void)addCount
{
    _count ++;
    NSLog(@"当前所有按钮已经累计点击了: %ld 次",_count);
}
@end
