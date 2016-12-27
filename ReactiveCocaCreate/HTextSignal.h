//
//  HTextSignal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HSignal.h"
#import "HProtocalBase.h"
@interface HTextSignal : HSignal<HProtocalBase>

+(instancetype)hTextSignal;

+ (instancetype)subscriberWithNext:(void (^)(id<HProtocalBase> next))TextNext;


@end
