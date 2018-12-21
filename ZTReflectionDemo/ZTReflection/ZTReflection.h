//
//  ZTReflection.h
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTReflection : NSObject

+ (BOOL)performWithTarget:(id)target selectorStringAndParameter:(NSString *)selString, ...; // 判断能否响应某个方法，如果能响应则调用

+ (BOOL)performWithTarget:(id)target returnValue:(void *)returnValue selectorStringAndParameter:(NSString *)selString, ...;

/*
    返回值用来判断调用是否成功；如果需要获取调用方法的返回值，请使用returnValue
 */

@end
