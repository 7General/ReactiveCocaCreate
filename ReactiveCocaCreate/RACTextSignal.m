//
//  RACTextSignal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "RACTextSignal.h"

@interface RACTextSignal()

@property (nonatomic, copy) void (^TextNext)(id<RACBaseProctal> next);

@end

@implementation RACTextSignal

+ (instancetype)subscriberWithNext:(void (^)(id<RACBaseProctal> next))TextNext {
    RACTextSignal *protocal = [[self alloc] init];
    protocal->_TextNext = [TextNext copy];
    return protocal;
}

-(void)sendNext:(id)value {
    NSLog(@"----RACTextSignal-----sendNext---value:%@",value);
    @synchronized (self) {
        void (^nextBlock)(id) = [self.TextNext copy];
        if (nextBlock == nil) return;
        nextBlock(value);
    }
}
@end
