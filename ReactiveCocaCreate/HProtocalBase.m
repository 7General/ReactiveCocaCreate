//
//  HProtocal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HProtocalBase.h"

@interface HProtocalBase()
@property (nonatomic, copy) void (^next)(id value);
@end

@implementation HProtocalBase

+ (instancetype)subscriberWithNext:(void (^)(id x))next {
    HProtocalBase * Hp = [[self alloc] init];
    Hp->_next = next;
    return Hp;
}



-(void)sendNext:(id)value {
    @synchronized (self) {
        void (^nextBlock)(id) = [self.next copy];
        if (nextBlock == nil) return;
        nextBlock(value);
    }
}


@end
