//
//  UIControl+FY.h
//  runtimeUIButton
//
//  Created by Charlie on 15/9/14.
//  Copyright (c) 2015年 Swift. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIControl (FY)
@property (nonatomic, assign) NSTimeInterval acceptEventInterval;
@property (nonatomic) BOOL ignoreEvent;

@end
