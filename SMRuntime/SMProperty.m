//
//  SMProperty.m
//  SMRuntime
//
//  Created by SmileSun on 16-5-28.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "SMProperty.h"

@implementation SMProperty
+(SMProperty *)classProperty
{
    SMProperty * sm = [[SMProperty alloc]init];
    return sm;
}
-(void)smSelector
{
    NSLog(@"smSelector");
}
-(void)changeName
{
    NSLog(@"changeName");
}
-(void)completedDelegate
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(smDelegateSelector)]) {
            [self.delegate smDelegateSelector];
        }
    }
    
}
@end
