//
//  TextSignal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "RACBaseProctal.h"

@interface TextSignal : NSObject<RACBaseProctal>

+ (TextSignal *)createSignal:(void(^)(id<RACBaseProctal> subscriber))didSubscribe;
-(TextSignal *)content:(TextSignal *)custSignal;

-(TextSignal *)contents:(void(^)(id<RACBaseProctal> subscriber))didSubscribe;

//- (NSMutableArray * )subscribeNext:(void (^)(id<RACBaseProctal> nextB))nextBlock;
- (NSMutableArray *)subscribeNext:(void (^)(id x))nextBlock;
@end
