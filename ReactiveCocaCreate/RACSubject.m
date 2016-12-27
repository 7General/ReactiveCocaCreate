//
//  RACSubject.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "RACSubject.h"

@interface RACSubject()
@property (nonatomic, strong, readonly) NSMutableArray *subscribers;
@end



@implementation RACSubject
+ (instancetype)subject {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _subscribers = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (NSMutableArray *)subscribe:(id<RACBaseProctal>)subscriber {
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

- (void)enumerateSubscribersUsingBlock:(void (^)(id<RACBaseProctal> subscriber))block {
    NSArray *subscribers;
    @synchronized (self.subscribers) {
        subscribers = [self.subscribers copy];
    }
    for (id<RACBaseProctal> subscriber in subscribers) {
        block(subscriber);
    }
}

#pragma mark - RACBaseProctalDelegate
- (void)sendNext:(id)value {
    [self enumerateSubscribersUsingBlock:^(id<RACBaseProctal> subscriber) {
        [subscriber sendNext:value];
    }];
}

@end
