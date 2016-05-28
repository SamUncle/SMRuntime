//
//  UIButton+count.m
//  SMRuntime
//
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "UIButton+count.h"

@implementation UIButton (count)
+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        Class selfClass = [self class];
        SEL oriSel = @selector(sendAction:to:forEvent:);
        Method oriMethod = class_getInstanceMethod(selfClass, oriSel);
        SEL cusSel = @selector(SMsendAction:to:forEvent:);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSel);
        BOOL addSuc = class_addMethod(selfClass, oriSel, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        
        if (addSuc) {
            //NSLog(@"添加成功");
            // 添加成功：将源方法的实现替换到交换方法的实现
            class_replaceMethod(selfClass, cusSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
            
        }else{
            //NSLog(@"添加失败");
            // 添加失败：说明源方法已经有实现,直接将两个方法的实现交换
            method_exchangeImplementations(oriMethod, cusMethod);
            
        }
    });
}
- (void)SMsendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [[SMTool SMShareManager] addCount];//所有按钮点击累计的次数
    [self SMsendAction:action to:target forEvent:event];
}

@end
