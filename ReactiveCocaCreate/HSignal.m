//
//  HSignal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HSignal.h"
#import "HSubject.h"
#import "HTextSignal.h"

@implementation HSignal

- (void)subscribeNext:(void (^)(id x))nextBlock {
    NSCParameterAssert(nextBlock != NULL);
    HProtocalBase * Proctal = [HProtocalBase subscriberWithNext:nextBlock];
    [self subscribe:Proctal];
}

- (NSMutableArray *)subscribe:(id<HProtocalBase>)subscriber {
    NSCAssert(NO, @"This method must be overridden by subclasses");
    return nil;
}


#pragma mark - 创建信号工具
+ (HSignal *)createSignal:(void(^)(id<HProtocalBase> subscriber))didSubscribe{
    // 1：创建开始就要发送数据
    NSLog(@"111111");
    HSubject * signal = [HSubject subscriberWithNext:didSubscribe];
    return signal;
}

- (HSignal *)contetEvents:(void(^)(id<HProtocalBase> next))createdComplated {
    HSubject * subj = [HSubject hSubject];
    if (createdComplated) {
        createdComplated(subj);
    }
    NSLog(@"22222222");
    return subj;
}


@end
