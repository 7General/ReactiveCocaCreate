//
//  HSubject.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSignal.h"
#import "HProtocalBase.h"

@interface HSubject : HSignal<HProtocalBase>

+(instancetype)hSubject;

/**创建信号*/
- (void)subscribeNext:(void (^)(id x))nextBlock;

/**创建信号*/
+ (HSubject *)createSignal:(void(^)(id<HProtocalBase> subscriber))didSubscribe;
- (HSubject *)contetEvents:(void(^)(id<HProtocalBase> next))createdComplated;

@end
