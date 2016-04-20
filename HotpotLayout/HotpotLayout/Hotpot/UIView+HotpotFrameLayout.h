//
//  UIView+Hotpot.h
//  HotpotLayout
//
//  Created by meterscao on 16/4/18.
//  Copyright © 2016年 meterscao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotpotFrameLayout.h"

@interface UIView (HotpotFrameLayout)

@property(nonatomic)CGFloat left;
@property(nonatomic)CGFloat right;
@property(nonatomic)CGFloat top;
@property(nonatomic)CGFloat bottom;
@property(nonatomic)CGFloat centerX;
@property(nonatomic)CGFloat centerY;
@property(nonatomic)CGPoint origin;

@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGSize size;

-(void)frameLayout:(void(^)(HotpotFrameLayout *layout))block;

@end
