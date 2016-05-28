//
//  SMProperty.h
//  SMRuntime
//
//  Created by SmileSun on 16-5-28.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@protocol SMDelegate;
@interface SMProperty : NSObject
{
    NSString * _nickName;
}
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,assign) id<SMDelegate> delegate;
-(void)smSelector;
-(void)changeName;
+(SMProperty *)classProperty;
@end

@protocol SMDelegate <NSObject>

-(void)smDelegateSelector;
//预留一个方法,未来想用runtime添加方法时用这个
-(void)futureSelector;
@end
