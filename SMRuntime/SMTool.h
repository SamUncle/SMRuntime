//
//  SMTool.h
//  SMRuntime
//
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMTool : NSObject
@property(nonatomic,assign) NSInteger count;
+(instancetype)SMShareManager;
-(NSString *)changeMethod;
-(void)addCount;
@end
