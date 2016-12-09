//
//  RACBaseProctal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "RACBaseProctal.h"

@interface RACBaseProctal()

@property (nonatomic, copy) void (^next)(id value);

@end


@implementation RACBaseProctal
+ (instancetype)subscriberWithNext:(void (^)(id x))next {
    RACBaseProctal *protocal = [[self alloc] init];
    protocal->_next = [next copy];
    return protocal;
}


-(void)sendNext:(id)value {
    @synchronized (self) {
        void (^nextBlock)(id) = [self.next copy];
        if (nextBlock == nil) return;
        nextBlock(value);
    }
}

@end
