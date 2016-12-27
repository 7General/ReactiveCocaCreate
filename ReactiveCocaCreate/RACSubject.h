//
//  RACSubject.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACBaseProctal.h"
#import "RACSignal.h"
@interface RACSubject : RACSignal<RACBaseProctal>
+ (instancetype)subject;
@end
