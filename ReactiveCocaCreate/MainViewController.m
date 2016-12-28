//
//  MainViewController.m
//  ReactiveCocaCreate
//
//  Created by 王会洲 on 16/12/9.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "RACSubject.h"

#import "UIControl+RACKVOEvents.h"
#import "TextSignal.h"

@interface MainViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) TextSignal * testSignal;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    //    TextSubject * text = [[TextSubject alloc] init];
    
    //    [text setNameWithFormat:@"+name:%@",@"456"];
    //    [text operationTextSub];
}

-(void)initView {
    self.title = @"信号";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UITextField * userName = [[UITextField alloc] initWithFrame:CGRectMake(50, 290, 200, 44)];
    userName.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:userName];
    
    [userName firstComplate:^(NSString *str) {
        NSLog(@"===>>>>%@",str);
    }];
    
    [userName addTarget:self action:@selector(userClick:) forControlEvents:UIControlEventAllEvents];
//    TextSignal * signal = userName.rac_textSignal;
//    [signal subscribeNext:^(id x) {
//        NSLog(@"=================================%@",x);
//    }];
}
-(void)userClick:(UITextField *)sender {
    
}

















-(void)btnClick {
    RACSubject * subject = [RACSubject subject];
    [subject subscribeNext:^(NSString * x) {
        NSLog(@"-------%@",x);
    }];
    [subject sendNext:@"1234444444444"];
}
@end
