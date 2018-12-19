//
//  Test.h
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Header.h"

@interface Test : NSObject

+ (NSArray *)test:(id)test p1:(NSString *)p1 p2:(unsigned int)p2 p3:(double)p3 p4:(CGSize)p4 p5:(NSNull *)p5 p6:(void(^)(void))p6 p7:(BOOL)p7 p8:(char)p8 p9:(char *)p9 p10:(YY)p10 p11:(SEL)p11 p12:(void **)p12 p13:(void ***)p13 p14:(Class)p14 p15:(IMP)p15;

+ (void)test:(int)i;

- (void)test;

@end
