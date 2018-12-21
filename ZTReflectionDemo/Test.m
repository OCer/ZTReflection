//
//  Test.m
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import "Test.h"

@implementation Test

+ (NSArray *)test:(id)test p1:(NSString *)p1 p2:(unsigned int)p2 p3:(double)p3 p4:(CGSize)p4 p5:(NSNull *)p5 p6:(void(^)(void))p6 p7:(BOOL)p7 p8:(char)p8 p9:(char *)p9 p10:(YY)p10 p11:(SEL)p11 p12:(void **)p12 p13:(void ***)p13 p14:(Class)p14 p15:(IMP)p15
{
    NSLog(@"test = %@  p1 = %@ p2 = %u p3 = %f p4 = %@ p5 = %@ p6 = %@ p7 = %d p8 = %c p9 = %s p10.i = %d p10.j = %f p10.k = %ld p11 = %@ p12 = %p p13 = %p p14 = %@ p15 = %p", test, p1, p2, p3, NSStringFromCGSize(p4), p5, p6, p7, p8, p9, p10.i, p10.j, p10.k, NSStringFromSelector(p11), p12, p13, NSStringFromClass(p14), p15);
    
    if (p6)
    {
        p6();
    }
    
    return [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
}

+ (void)test:(int)i
{
    NSLog(@"%s i = %d", __func__, i);
    
    return;
}

+ (int)testReturnInt
{
    return 2333;
}

+ (double)testReturnDouble
{
    return 4.333f;
}

+ (char)testReturnChar
{
    return 'E';
}

+ (char *)testReturnStr
{
    return "EDG";
}

+ (char **)testReturnP
{
    char *string = "PP";
    char **p1 = &string;
    
    NSLog(@"PP1 = %p PP2 = %p", string, p1);
    return p1;
}

+ (Class)testReturnClass
{
    return [NSData class];
}

+ (IMP)testReturnIMP
{
    IMP imp = [self methodForSelector:NSSelectorFromString(@"test")];
    NSLog(@"imp = %p", imp);
    
    return imp;
}

+ (SEL)testReturnSEL
{
    return NSSelectorFromString(@"KK");
}

+ (CGSize)testReturnCGSize
{
    return CGSizeMake(99, 88);
}

+ (void(^)(void))testReturnBlock
{
    void (^block)(void) = ^(){
        NSLog(@"testReturnBlock call");
    };
    
    return block;
}

+ (YY)testReturnStruct
{
    YY yy = {666, 23.8f, 777};
    return yy;
}

- (void)test
{
    NSLog(@"%s", __func__);
    
    return;
}

@end
