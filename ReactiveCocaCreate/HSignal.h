//
//  HSignal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "HProtocalBase.h"

@class HSubject;
@class HTextSignal;

@interface HSignal : NSObject<HProtocalBase>


- (void)subscribeNext:(void (^)(id x))nextBlock;

@end
