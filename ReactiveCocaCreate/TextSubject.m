//
//  TextSubject.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TextSubject.h"

@implementation TextSubject

-(void)nslogsCustom{
    NSLog(@"-----nslogsCustom");
}

-(instancetype)setNameWithFormat:(NSString *)format, ... {

    return self;
}
@end

@implementation TextSubject (Operations)
-(void)operationTextSub {
    NSLog(@"------operationTextSub");
}
@end
