//
//  RACSignal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACBaseProctal.h"



@interface RACSignal : NSObject

- (NSMutableArray *)subscribe:(id<RACBaseProctal>)subscriber;

- (NSMutableArray * )subscribeNext:(void (^)(id x))nextBlock;






@end
