//
//  ViewController.m
//  runtimeUIButton
//
//  Created by Charlie on 15/9/14.
//  Copyright (c) 2015年 Swift. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+FY.h"

@interface ViewController ()
{
    UIButton * _button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ui];
    
}
-(void)ui{
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(60, 60, 100, 40);
    [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"按钮" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _button.acceptEventInterval = 2;
    [self.view addSubview:_button];
}
-(void)click{
    NSLog(@"click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
