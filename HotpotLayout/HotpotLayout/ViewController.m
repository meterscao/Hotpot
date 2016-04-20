//
//  ViewController.m
//  HotpotLayout
//
//  Created by meterscao on 16/4/20.
//  Copyright © 2016年 meters. All rights reserved.
//

#import "ViewController.h"
#import "Hotpot.h"

@interface ViewController ()
@property(nonnull)UIView *redView;
@property(nonnull)UIView *blueView;;
@property(nonnull)UIView *blackView;
@property(nonnull)UIView *orangeView;;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [[UIView alloc]init];
    self.blueView = [[UIView alloc]init];
    self.blackView = [[UIView alloc]init];
    self.orangeView = [[UIView alloc]init];
    
    self.redView.layer.cornerRadius = 4.f;
    self.redView.backgroundColor  = [[UIColor redColor]colorWithAlphaComponent:0.7f];
    self.redView.layer.masksToBounds = YES;
    [self.view addSubview:self.redView];
    
    self.blueView.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.8f];
    self.blueView.layer.cornerRadius = 4.f;
    self.blueView.layer.masksToBounds = YES;
    [self.view addSubview:self.blueView];
    
    self.blackView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8f];
    self.blackView.layer.cornerRadius = 4.f;
    self.blackView.layer.masksToBounds = YES;
    [self.view addSubview:self.blackView];
    
    self.orangeView.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.8f];
    self.orangeView.layer.cornerRadius = 20.f;
    self.orangeView.layer.masksToBounds = YES;
    [self.view addSubview:self.orangeView];
    
}



-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    [self.redView frameLayout:^(HotpotFrameLayout *layout) {
        layout.left.equalTo(self.view.left).offset(20.f);
        layout.right.equalTo(self.view.right).offset(-20.f);
        layout.height.equalTo(40.f);
        layout.top.equalTo(self.view.top).offset(40.f);
    }];
    
    [self.blueView frameLayout:^(HotpotFrameLayout *layout) {
        layout.width.equalTo(100.f);
        layout.centerX.equalTo(self.view.centerX);
        layout.bottom.equalTo(self.view.bottom).offset(-50.f);
        layout.height.equalTo(40.f);
    }];
    
    [self.blackView frameLayout:^(HotpotFrameLayout *layout) {
        layout.height.equalTo(100.f);
        layout.centerY.equalTo(self.view.centerY);
        layout.left.equalTo(self.view.left).offset(20.f);
        layout.right.equalTo(self.blueView.left);
    }];
    
    [self.orangeView frameLayout:^(HotpotFrameLayout *layout) {
        layout.width.equalTo(40.f);
        layout.height.equalTo(40.f);
        layout.left.equalTo(self.blackView.left);
        layout.top.equalTo(self.blackView.bottom).offset(20.f);
    }];
}



@end
