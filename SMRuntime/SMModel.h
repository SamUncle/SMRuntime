//
//  SMModel.h
//  SMRuntime
//
//  Created by SmileSun on 16-5-29.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMModel : NSObject
@property(nonatomic,copy)NSString *chinese;
@property(nonatomic,copy)NSString *english;
+(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
