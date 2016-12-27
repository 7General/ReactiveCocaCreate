//
//  TextSignal.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TextSignal.h"
#import "RACTextSignal.h"

@interface TextSignal()
@property (nonatomic, strong, readonly) NSMutableArray *subscribers;
@end


@implementation TextSignal

+ (TextSignal *)createSignal:(void(^)(id<RACBaseProctal> subscriber))didSubscribe {
    return [RACTextSignal subscriberWithNext:didSubscribe];
}

-(TextSignal *)content:(TextSignal *)custSignal {
    NSLog(@"------content1------------");
    return [TextSignal createSignal:^(id<RACBaseProctal> subscriber) {
//        NSLog(@"------content-2-----------");
//        [self subscribeNext:^(id x) {
//            [subscriber sendNext:x];
//        }];
    }];
}
-(TextSignal *)contents:(void(^)(id<RACBaseProctal> subscriber))didSubscribe {
    NSLog(@"---------------222222222222222222222");
    return [TextSignal createSignal:^(id<RACBaseProctal> subscriber) {
        
    }];
}

- (NSMutableArray *)subscribeNext:(void (^)(id x))nextBlock{
    NSCParameterAssert(nextBlock != NULL);
    NSLog(@"subscribeNext");
    RACBaseProctal * Proctal = [RACBaseProctal subscriberWithNext:nextBlock];
    return [self subscribe:Proctal];
}


- (NSMutableArray *)subscribe:(id<RACBaseProctal>)subscriber {
    NSLog(@"subscribe");
    NSCParameterAssert(subscriber != nil);
    NSMutableArray *subscribers = self.subscribers;
    @synchronized (subscribers) {
        [subscribers addObject:subscriber];
    }
    
    //@synchronized (subscribers) {
        // 根据条件用来获取一个NSUIndex 对象，主要是根据条件进行数据遍历使用
        // 这里添加了一个参数，用来表示遍历是从前向后遍历还是从后遍历。
        // NSInteger index =  [subscribers indexOfObjectWithOptions:(NSEnumerationReverse) passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //    return obj == subscriber;
        // }];
        // if (index != NSNotFound) [subscribers removeObjectAtIndex:index];
    //}
    return subscribers;
}

- (void)enumerateSubscribersUsingBlock:(void (^)(id<RACBaseProctal> subscriber))block {
    NSLog(@"enumerateSubscribersUsingBlock");
    NSArray *subscribers;
    @synchronized (self.subscribers) {
        subscribers = [self.subscribers copy];
    }
    for (id<RACBaseProctal> subscriber in subscribers) {
        block(subscriber);
    }
}


- (void)sendNext:(id)value {
    NSLog(@"sendNext");
    [self enumerateSubscribersUsingBlock:^(id<RACBaseProctal> subscriber) {
        [subscriber sendNext:value];
    }];
}

@end
