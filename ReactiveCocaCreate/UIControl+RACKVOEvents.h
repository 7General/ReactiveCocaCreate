//
//  UIControl+RACKVOEvents.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACTextSignal.h"
#import "TextSignal.h"

typedef void(^emcails)(NSString * lginName);

@interface UITextField (RACKVOEvents)

@property (nonatomic, strong) TextSignal * CusSignal;

- (TextSignal *)rac_textSignal;



// ********
//- (TextSignal *)rac_signalForControlEvents:(UIControlEvents)controlEvents;


@property (nonatomic, copy) emcails  emailBlock;
-(void)setEmailBlock:(emcails)emailBlock;

-(NSString *)firstComplate:(void(^)(NSString *str))complated;

-(NSString *)secondComplate:(void(^)(NSString *str))complated;

@end
