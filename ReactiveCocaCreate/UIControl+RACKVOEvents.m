//
//  UIControl+RACKVOEvents.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "UIControl+RACKVOEvents.h"


@implementation UITextField (RACKVOEvents)

@dynamic CusSignal;


- (TextSignal *)rac_textSignal {
    NSLog(@"rac_textSignal");
    TextSignal * signal = [TextSignal createSignal:^(id<RACBaseProctal> subscriber) {
        NSLog(@"---------------33333333333333333333");
        
    }];
    [self addTarget:signal action:@selector(RAC_Click) forControlEvents:UIControlEventAllEvents];
    return signal;
}
-(void)RAC_Click {
    TextSignal * signal = [[TextSignal alloc] init];
    [signal sendNext:self.text];
}

//
- (TextSignal *)rac_signalForControlEvents:(UIControlEvents)controlEvents {
    return [TextSignal createSignal:^(id<RACBaseProctal> subscriber) {
        //[self addTarget:subscriber action:@selector(sendNext:) forControlEvents:controlEvents];
    }];
}

-(NSString *)firstComplate:(void(^)(NSString *str))complated {
    NSLog(@"------1:firstComplate");
    return [self secondComplate:complated];
}

-(NSString *)secondComplate:(void(^)(NSString *str))complated {
//    NSLog(@"------2:secondComplate");
//    if (complated) {
//      complated(@"123456");
//    }
//    return @"789";
    return [self firstComplate:^(NSString *str) {
        
    }];
}




@end
