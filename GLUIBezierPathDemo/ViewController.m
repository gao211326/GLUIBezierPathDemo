//
//  ViewController.m
//  GLUIBezierPathDemo
//
//  Created by 高磊 on 2017/2/15.
//  Copyright © 2017年 高磊. All rights reserved.
//

#import "ViewController.h"

#import "BezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BezierPathView *bezierPathView = [[BezierPathView alloc] initWithFrame:self.view.bounds];
    bezierPathView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bezierPathView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
