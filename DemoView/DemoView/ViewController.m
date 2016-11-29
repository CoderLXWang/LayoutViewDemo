//
//  ViewController.m
//  DemoView
//
//  Created by sharejoy_lx on 16-11-28.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "ViewController.h"
#import "ConsumeView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) ConsumeView *consumeView;

@end

@implementation ViewController

- (ConsumeView *)consumeView {
    if (!_consumeView) {
        _consumeView = [[ConsumeView alloc] init];
        _consumeView.expend = NO;
    }
    return _consumeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.consumeView];
    [self.consumeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.consumeView.expend = !self.consumeView.expend;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
