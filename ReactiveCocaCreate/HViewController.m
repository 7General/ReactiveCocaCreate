//
//  HViewController.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "HViewController.h"
#import "HSubject.h"
#import "UITextField+Provate.h"

@interface HViewController ()
@property (nonatomic, strong) UITextField * userNameFiled;
@property (nonatomic, strong) HSubject * signal;
@end

@implementation HViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    HSubject * signal = [HSubject hSubject];
//    [signal subscribeNext:^(id x) {
//             NSLog(@"----%@",x);
//    }];
//
//    [signal sendNext:@"34567"];
    
    
    self.userNameFiled = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    self.userNameFiled.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.userNameFiled];
    self.signal = self.userNameFiled.rac_textSignal;
    [self.signal subscribeNext:^(id x) {
        NSLog(@"-------------------------->>>>>>>>>>>>>>>>>%@",x);
    }];
    
    
    
    
}


@end
