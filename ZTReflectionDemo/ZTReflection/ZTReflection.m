//
//  ZTReflection.m
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import "ZTReflection.h"
#import <UIKit/UIKit.h>

@implementation ZTReflection

+ (ZTReflectionResults)performWithTarget:(id)target selectorStringAndParameter:(NSString *)selString, ...
{
    va_list params;
    va_start(params, selString);
    ZTReflectionResults result = [self performWithTarget:target returnValue:NULL selectorString:selString parameter:params];
    va_end(params);
    
    return result;
}

+ (ZTReflectionResults)performWithTarget:(id)target returnValue:(void *)returnValue selectorStringAndParameter:(NSString *)selString, ...
{
    va_list params;
    va_start(params, selString);
    ZTReflectionResults result = [self performWithTarget:target returnValue:returnValue selectorString:selString parameter:params];
    va_end(params);
    
    return result;
}

+ (ZTReflectionResults)performWithTarget:(id)target returnValue:(void *)returnValue selectorString:(NSString *)selString parameter:(va_list)params
{
    if (target == nil)
    {
        return ZTReflectionResultsTarget;
    }
    
    if ([selString length] == 0)
    {
        return ZTReflectionResultsSelector;
    }
    
    SEL sel = NSSelectorFromString(selString);
    NSMethodSignature *signature = [target methodSignatureForSelector:sel];
    
    if (signature != nil)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:target];
        [invocation setSelector:sel];
        
        NSUInteger count = [signature numberOfArguments];
        
        if (count > 2)
        {
            int i = 2;
            
            do
            {
                const char *type = [signature getArgumentTypeAtIndex:i];
                if ((strcmp(type, @encode(double)) == 0) || (strcmp(type, @encode(float)) == 0))
                {
                    double f = va_arg(params, double);
                    [invocation setArgument:&f atIndex:i];
                }
                else if ((strcmp(type, @encode(unsigned int)) == 0) || (strcmp(type, @encode(unsigned char)) == 0) || (strcmp(type, @encode(unsigned short)) == 0))
                {
                    unsigned int temp = (unsigned int)va_arg(params, unsigned int);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if ((strcmp(type, @encode(int)) == 0) || (strcmp(type, @encode(short)) == 0) || (strcmp(type, @encode(char)) == 0) || (strcmp(type, @encode(bool)) == 0) || (strcmp(type, @encode(BOOL)) == 0))
                {
                    int temp = va_arg(params, int);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if (strcmp(type, @encode(long)) == 0)
                {
                    long temp = va_arg(params, long);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if (strcmp(type, @encode(unsigned long)) == 0)
                {
                    unsigned long temp = (unsigned long)va_arg(params, unsigned long);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if (strcmp(type, @encode(long long)) == 0)
                {
                    long long temp = va_arg(params, long long);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if (strcmp(type, @encode(unsigned long long)) == 0)
                {
                    unsigned long long temp = (unsigned long long)va_arg(params, unsigned long long);
                    [invocation setArgument:&temp atIndex:i];
                }
                else if (strcmp(type, @encode(SEL)) == 0)
                {
                    SEL selTemp = va_arg(params, SEL);
                    if (selTemp)
                    {
                        [invocation setArgument:&selTemp atIndex:i];
                    }
                }
                else if (strcmp(type, @encode(IMP)) == 0)
                {
                    IMP imp = va_arg(params, IMP);
                    if (imp)
                    {
                        [invocation setArgument:&imp atIndex:i];
                    }
                }
                else if (strcmp(type, @encode(Class)) == 0)
                {
                    Class class = va_arg(params, Class);
                    if (class)
                    {
                        [invocation setArgument:&class atIndex:i];
                    }
                }
                else if (strncmp(type, "@", 1) == 0)
                {
                    id obj = va_arg(params, id);
                    if (obj)
                    {
                        [invocation setArgument:&obj atIndex:i];
                    }
                }
                else if (strncmp(type, "{", 1) == 0)
                {
                    if (strcmp(type, @encode(CGPoint)) == 0)
                    {
                        CGPoint actual = (CGPoint)va_arg(params, CGPoint);
                        [invocation setArgument:&actual atIndex:i];
                    } else if (strcmp(type, @encode(CGSize)) == 0)
                    {
                        CGSize actual = (CGSize)va_arg(params, CGSize);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(UIEdgeInsets)) == 0)
                    {
                        UIEdgeInsets actual = (UIEdgeInsets)va_arg(params, UIEdgeInsets);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(CGRect)) == 0)
                    {
                        CGRect actual = (CGRect)va_arg(params, CGRect);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(NSRange)) == 0)
                    {
                        NSRange actual = (NSRange)va_arg(params, NSRange);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(CGVector)) == 0)
                    {
                        CGVector actual = (CGVector)va_arg(params, CGVector);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(UIOffset)) == 0)
                    {
                        UIOffset actual = (UIOffset)va_arg(params, UIOffset);
                        [invocation setArgument:&actual atIndex:i];
                    }
                    else if (strcmp(type, @encode(CGAffineTransform)) == 0)
                    {
                        CGAffineTransform actual = (CGAffineTransform)va_arg(params, CGAffineTransform);
                        [invocation setArgument:&actual atIndex:i];
                    }
#ifdef __IPHONE_11_0
                    else if (strcmp(type, @encode(NSDirectionalEdgeInsets)) == 0)
                    {
                        NSDirectionalEdgeInsets actual = (NSDirectionalEdgeInsets)va_arg(params, NSDirectionalEdgeInsets);
                        [invocation setArgument:&actual atIndex:i];
                    }
#endif
                    else
                    {
                        id obj = va_arg(params, id);
                        NSValue *temp = (NSValue *)obj;
                        void *value = alloca(sizeof(void *));
                        if (value != NULL)
                        {
                            [temp getValue:value];
                            [invocation setArgument:value atIndex:i];
                        }
                    }
                }
                else
                {
                    void *p = va_arg(params, void *);
                    if (p)
                    {
                        [invocation setArgument:&p atIndex:i];
                    }
                }
                
                ++i;
            } while(i < count);
            
            [invocation retainArguments];
            va_end(params);
        }
        
        [invocation invoke];
        
        // 获取返回值
        if (([signature methodReturnLength] != 0) && (returnValue != NULL))
        {
            [invocation getReturnValue:returnValue];
        }
        
        return ZTReflectionResultsSuccessful;
    }
    
    return ZTReflectionResultsError;
}

@end
