//
//  HotpotFrameLayoutConfig.h
//  HotpotLayout
//
//  Created by meterscao on 16/4/18.
//  Copyright © 2016年 meterscao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HotpotFrameLayout : NSObject


- (instancetype)initWithView:(UIView *)view;

-(HotpotFrameLayout *(^)(CGFloat to))equalTo;
-(HotpotFrameLayout *(^)(CGFloat offset))offset;


@property(nonatomic) HotpotFrameLayout *left;
@property(nonatomic) HotpotFrameLayout *right;
@property(nonatomic) HotpotFrameLayout *top;
@property(nonatomic) HotpotFrameLayout *bottom;
@property(nonatomic) HotpotFrameLayout *width;
@property(nonatomic) HotpotFrameLayout *height;
@property(nonatomic) HotpotFrameLayout *centerX;
@property(nonatomic) HotpotFrameLayout *centerY;
@property(nonatomic) HotpotFrameLayout *center;
@property(nonatomic) HotpotFrameLayout *origin;
@property(nonatomic) HotpotFrameLayout *size;


-(void)render;

@end
