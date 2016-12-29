//
//  HTextSignal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HTextSignal.h"

@interface HTextSignal()
@property (nonatomic, copy) void (^TextNext)(id<HProtocalBase> next);
@end

@implementation HTextSignal
+(instancetype)hTextSignal {
    return [[self alloc] init];
}

#pragma mark - 创建信号
+ (instancetype)subscriberWithNext:(void (^)(id<HProtocalBase> next))TextNext {
    HTextSignal *protocal = [[self alloc] init];
    protocal->_TextNext = [TextNext copy];
    return protocal;
}

-(void)sendNext:(id)value {
    @synchronized (self) {
        void (^nextBlock)(id) = [self.TextNext copy];
        if (nextBlock == nil) return;
        nextBlock(value);
    }
}

@end
