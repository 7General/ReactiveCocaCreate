//
//  HSubject.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HSubject.h"

@interface HSubject()
@property (nonatomic, strong, readonly) NSMutableArray *subscribers;

@property (nonatomic, copy) void (^TextNext)(id<HProtocalBase> next);
@end


@implementation HSubject


+(instancetype)hSubject {
    return [[self alloc] init];
}

- (void)subscribeNext:(void (^)(id x))nextBlock {
    NSCParameterAssert(nextBlock != NULL);
    HProtocalBase * Proctal = [HProtocalBase subscriberWithNext:nextBlock];
    [self subscribe:Proctal];
}

- (NSMutableArray *)subscribe:(id<HProtocalBase>)subscriber {
    NSCParameterAssert(subscriber != nil);
    NSMutableArray *subscribers = self.subscribers;
    @synchronized (subscribers) {
        [subscribers addObject:subscriber];
    }
    @synchronized (subscribers) {
        // 根据条件用来获取一个NSUIndex 对象，主要是根据条件进行数据遍历使用
        // 这里添加了一个参数，用来表示遍历是从前向后遍历还是从后遍历。
        // NSInteger index =  [subscribers indexOfObjectWithOptions:(NSEnumerationReverse) passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //    return obj == subscriber;
        // }];
        // if (index != NSNotFound) [subscribers removeObjectAtIndex:index];
    }
    return subscribers;
}

- (void)enumerateSubscribersUsingBlock:(void (^)(id<HProtocalBase> subscriber))block {
    NSArray *subscribers;
    @synchronized (self.subscribers) {
        subscribers = [self.subscribers copy];
    }
    for (id<HProtocalBase> subscriber in subscribers) {
        block(subscriber);
    }
}

#pragma mark - RACBaseProctalDelegate
- (void)sendNext:(id)value {
    NSLog(@"----HSubject");
    [self enumerateSubscribersUsingBlock:^(id<HProtocalBase> subscriber) {
        [subscriber sendNext:value];
    }];
}

#pragma mark - 创建信号
+ (instancetype)subscriberWithNext:(void (^)(id<HProtocalBase> next))TextNext {
    HSubject *protocal = [[self alloc] init];
    protocal->_TextNext = [TextNext copy];
    return protocal;
}


-(void)goes {
    NSLog(@"----goes");
}
//-(void)sendNext:(id)value {
//    NSLog(@"----RACTextSignal-----sendNext---value:%@",value);
//    @synchronized (self) {
//        void (^nextBlock)(id) = [self.TextNext copy];
//        if (nextBlock == nil) return;
//        nextBlock(value);
//    }
//}


@end
