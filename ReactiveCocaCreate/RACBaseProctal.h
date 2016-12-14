//
//  RACBaseProctal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RACBaseProctal <NSObject>
@optional

- (void)sendNext:(id)value;

@end


@interface RACBaseProctal : NSObject<RACBaseProctal>
+ (instancetype)subscriberWithNext:(void (^)(id x))next;
@end
