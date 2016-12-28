#import "UITextField+Provate.h"
#import "HTextSignal.h"
#import "HSubject.h"


@implementation UITextField (Provate)

//-(void)H_addEvents {
//    [self addTarget:self action:@selector(textFile:) forControlEvents:UIControlEventAllEvents];
//}
//-(void)textFile:(UITextField *)sender {
//    NSLog(@"-----%@",sender.text);
//
//    [[self rac_textSignal] sendNext:sender.text];
//}


- (HSubject *)rac_textSignal {
    HSubject * signal = [[HSubject createSignal:^(id<HProtocalBase> subscriber) {
    
    }] contetEvents:^(id<HProtocalBase> next) {
        [self addTarget:next action:@selector(sendNext:) forControlEvents:UIControlEventAllEvents];
    }];
    return signal;
}

@end
