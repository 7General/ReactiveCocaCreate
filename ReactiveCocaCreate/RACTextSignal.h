//
//  RACTextSignal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TextSignal.h"
#import "RACBaseProctal.h"

@interface RACTextSignal : TextSignal<RACBaseProctal>
+ (instancetype)subscriberWithNext:(void (^)(id<RACBaseProctal> next))TextNext;

@end
