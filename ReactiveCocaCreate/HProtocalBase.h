//
//  HProtocal.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

///订阅者
#import <Foundation/Foundation.h>


@protocol HProtocalBase <NSObject>
@optional
- (void)sendNext:(id)value;
@end

@interface HProtocalBase : NSObject<HProtocalBase>
+ (instancetype)subscriberWithNext:(void (^)(id x))next;
@end
