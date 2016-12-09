//
//  RACSignal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "RACSignal.h"


@implementation RACSignal

- (NSMutableArray * )subscribeNext:(void (^)(id x))nextBlock {
    NSCParameterAssert(nextBlock != NULL);
    RACBaseProctal * Proctal = [RACBaseProctal subscriberWithNext:nextBlock];
    return [self subscribe:Proctal];
}

- (NSMutableArray *)subscribe:(id<RACBaseProctal>)subscriber {
    NSCAssert(NO, @"This method must be overridden by subclasses");
    return nil;
}


@end
