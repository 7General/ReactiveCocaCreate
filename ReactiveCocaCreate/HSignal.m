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



@end
