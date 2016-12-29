#import "UITextField+Provate.h"
#import "HTextSignal.h"
#import "HSubject.h"


@implementation UITextField (Provate)

- (HSubject *)rac_textSignal {
    HSubject * signal = [[HSubject createSignal:^(id<HProtocalBase> subscriber) {
        
    }] contetEvents:^(id<HProtocalBase> next) {
        [self addTarget:next action:@selector(sendNext:) forControlEvents:UIControlEventAllEvents];
    }];
    return signal;
}

@end
