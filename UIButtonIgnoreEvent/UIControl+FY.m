//
//  UIControl+FY.m
//  runtimeUIButton
//
//  Created by Charlie on 15/9/14.
//  Copyright (c) 2015年 Swift. All rights reserved.
//

#import "UIControl+FY.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent = "UIControl_ignoreEvent";


@implementation UIControl (FY)


- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSTimeInterval)acceptEventInterval {
    
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
-(void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)ignoreEvent{
        return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}
+(void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.ignoreEvent) return;
    if (self.acceptEventInterval > 0)
    {
        self.ignoreEvent = YES;
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.acceptEventInterval];
    }
    [self _sendAction:action to:target forEvent:event];
}
@end
