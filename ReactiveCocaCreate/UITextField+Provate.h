//
//  UITextField+Provate.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSignal.h"
@class HSubject;

@interface UITextField (Provate)
-(void)H_addEvents;

- (HSignal *)rac_textSignal;
@end
