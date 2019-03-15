//
//  ZTReflection.h
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger
{
    ZTReflectionResultsSuccessful = 0, // 调用成功
    ZTReflectionResultsError,          // 调用失败，类无法响应方法
    ZTReflectionResultsTarget,         // 调用失败，无target
    ZTReflectionResultsSelector        // 调用失败，无target
} ZTReflectionResults; // 结果集

@interface ZTReflection : NSObject

+ (ZTReflectionResults)performWithTarget:(id)target selectorStringAndParameter:(NSString *)selString, ...; // 判断能否响应某个方法，如果能响应则调用

+ (ZTReflectionResults)performWithTarget:(id)target returnValue:(void *)returnValue selectorStringAndParameter:(NSString *)selString, ...;

/*
    返回值用来判断调用是否成功；如果需要获取调用方法的返回值，请使用returnValue
 */

@end
