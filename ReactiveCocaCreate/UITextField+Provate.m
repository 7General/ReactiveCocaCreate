//
//  UITextField+Provate.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "UITextField+Provate.h"
#import "HTextSignal.h"
#import "HSubject.h"

@implementation UITextField (Provate)
-(void)H_addEvents {
    [self addTarget:self action:@selector(textFile:) forControlEvents:UIControlEventAllEvents];
}
-(void)textFile:(UITextField *)sender {
    NSLog(@"-----%@",sender.text);
    HSubject * subg = [HSubject hSubject];
    [subg sendNext:sender.text];
}


- (HSignal *)rac_textSignal {
    HSignal * signal = [[HSignal createSignal:^(id<HProtocalBase> subscriber) {
        NSLog(@"----rac_textSignal");
    }] contetEvents:^(id<HProtocalBase> next) {
        [self addTarget:next action:@selector(goes) forControlEvents:UIControlEventAllEvents];
    }];
    
    
    return  signal;
}





@end
