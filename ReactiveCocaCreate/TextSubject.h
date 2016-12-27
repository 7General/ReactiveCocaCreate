//
//  TextSubject.h
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextSubject : NSObject

-(void)nslogsCustom;

@end


@interface TextSubject()

@property (nonatomic, copy) NSString * name;

- (instancetype)setNameWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);
@end



@interface TextSubject(Operations)

-(void)operationTextSub;

@end

