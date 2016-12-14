//
//  MainViewController.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "RACSubject.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}
-(void)initView {
    self.title = @"信号";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick {
    
    RACSubject * subject = [RACSubject subject];
    
    [subject subscribeNext:^(NSString * x) {
        NSLog(@"-------%@",x);
    }];
    [subject sendNext:@"1234444444444"];
//    [subject sendNext:@"123"];
    
    
}



@end
