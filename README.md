# Hotpot


 [![CocoaPods compatible](https://img.shields.io/cocoapods/v/Hotpot.svg?style=flat)](https://cocoapods.org/pods/Hotpot)  [![License: MIT](https://img.shields.io/cocoapods/l/Hotpot.svg?style=flat)](http://opensource.org/licenses/MIT)


`Hotpot` 是一个轻量的 iOS 布局辅助框架。用类似于 `AutoLayout` 的位置和关系描述，以及从 [Masonry](https://github.com/SnapKit/Masonry) 平行过渡的语法，简洁直观地为 UI 元素设置 `frame` 布局信息，取代了 `UIView` 自带的比较简陋的   `frame`  设置方法。

`Hotpot` 本质上仍然是 `frame` 布局方式，只不过将设置 `frame` 信息的步骤由之前固定的 `CGRectMake(x,y,width,height)` ，变成了更灵活和更直观的方式。

## 引入

十分推荐使用 [Cocoapods](http://cocoapods.org) 来为你的项目引入 `Hotpot` ：

	platform:ios,'7.0'
	pod 'Hotpot'
	
**注意**: 请指定iOS的使用版本号，最低是`iOS7.0`

`Hotpot` 仅能良好运行地在 iOS7+ 的 ARC 项目中，请确保使用最新版本的 XCode。

一切就绪后，在需要使用`Hotpot`的文件中引入头文件：

	#import "Hotpot.h"
	


## 基本属性

`Hotpot` 扩展了几个 `UIView` 的基本布局属性，这些属性是可读并且可写的，通过这些属性，可以更加灵活地在代码中读取和设置元素的 `frame` 信息。

比如，在原本的 `UIKit` 中，为了读取一个元素的宽度，需要使用这样的代码：

	／／ 获取 testView 的宽度
	CGFloat width = CGRectGetWidth(testView.frame);

 `UIKit` 没有提供单独设置某一项布局属性的方法，需要设置元素的宽度，也必须重新设置其 `frame` 信息：

	／／ 设置 testView 的宽度为 120.f
	testView.frame = CGRectMake(CGRectGetMinX(testView.frame),
                                CGRectGetMinY(testView.frame),
                                120.f,
                                CGRectGetHeight(testView.frame));
	

有了`Hotpot`，只需要这样的代码：

	／／ 获取 testView 的宽度
	CGFloat width = testView.width;
	
	／／ 设置 testView 的宽度为 120.f
	testView.width = 120.f;

除了`width`,`Hotpot` 还提供了更多这样便捷的属性：

Hotpot 属性 | UIKit 方法 | 类型
------------ | ------------- | -------
`left`	 | `CGRectGetMinX` | `CGFloat`
`right`	 | `CGRectGetMaxX` | `CGFloat`
`top`	 | `CGRectGetMinY` | `CGFloat`
`bottom`	 | `CGRectGetMaxY` | `CGFloat`
`width`	 | `CGRectGetWidth` | `CGFloat`
`height`	 | `CGRectGetHeight` | `CGFloat`
`centerX`	 | `CGRectGetMinX` | `CGFloat`
`centerY`	 | `CGRectGetMinX` | `CGFloat`
`origin`	| -- | `CGPint`
`size`	| -- | `CGSize`

有了这些属性，在布局的时候可以更加的灵活的只针对某一项进行设置：

	viewA.left = viewB.right + 20.f;
    viewB.top = viewC.bottom + 20.f;
    viewC.centerX = self.view.centerX;
    viewD.width = 100.f;
    viewE.size = CGSizeMake(100.f, 80.f);

## 布局描述

`AutoLayout` 通过对 UI 元素布局信息的描述，创建了一系列约束的数组。这些约束信息记录了 UI 元素相对于其他元素的位置关系和大小信息。

传统的 `frame` 布局思路里面，一个UI元素的布局由一组坐标和一组宽高信息确定。通常界面上 UI 元素的布局是呈现出相互关系的，并且这些相对关系是非常直观的，但是，在写代码的时候需要将这些原本很清晰的相对关系，用冗长和难懂的 `CGRectMake` 代码写出来，这代码可读性很差，而且不便于维护。

比如，对于一个在水平方向居中，竖直方向居底部 30px 的元素的布局代码：

	viewA.frame = CGRectMake((CGRectGetWidth(self.view.bounds) - CGRectGetWidth(viewA.frame))/2,
                             CGRectGetMaxX(self.view.bounds) - CGRectGetHeight(viewA.frame) - 30.f,
                             CGRectGetWidth(viewA.frame),
                             CGRectGetHeight(viewA.frame)
                             );


有了`Hotpot`，只需要描述清楚位置关系即可：

	[viewA frameLayout:^(HotpotFrameLayout *layout) {
        layout.centerX.equalTo(self.view.centerX);
        layout.bottom.equalTo(self.view.bottom).offset(-30.f);
    }];
    
这样的代码更加清晰和可读，省掉了繁琐的计算逻辑，把代码的重点集中在布局关系的描述上面。

如果你使用过 `Masonry` ，那这样的代码语法就一定不会陌生，`Hotpot`使用了从 `Masonry` 平行过渡的语法，阅读起来非常清晰。

### 单位和数值

* equalTo

	`CGFloat` 表示关联到的属性。

* offset

	`CGFloat` 	表示偏移量。向左和向上便宜是负数，向下和向右为正数。



### 特别说明

`Hotpot`本质上还是 `frame` 布局，在一个元素的布局描述中如果使用了另一个元素的布局属性，请保证这个属性已经确定好了布局，这点是区别于 `AutoLayout` 的。比如：

	／／ 请确保 viewB 和 viewC 的布局已经完成
	[viewA frameLayout:^(HotpotFrameLayout *layout) {
        layout.left.equalTo(viewB.left);
        layout.top.equalTo(viewC.bottom).offset(30.f);
    }];
    
但是，在同一个元素的布局描述中，每一个属性都是相互独立的，不需要考虑先后顺序。

### 布局的时机

由于`Hotpot`终究是 `frame` 布局，所以关于布局的代码还是建议写在`viewDidLayoutSubviews` 或者 `viewDidLayout`中：




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

## 为什么不直接使用 Autolayout ／ Masonry ?



* 性能
	
	UI 元素比较多，布局关系复杂的场景，以及像 `UITableViewCell` 需要不断重复复用的场景， `frame` 布局性能要优于 `Autolayout` 。
* 动画

	在的动画实现上， `frame`  布局相对于  `Autolayout`  布局要更加直观和可控。

* 调试

	`Autolayout` 布局因为元素之间会互相影响，加上优先级的冲突，在实际的应用中调试起来不是很方便。而且对于xib中是使用了  `Autolayout`  属性的元素，在代码中更新约束也比较麻烦。
	
* 过渡

	仍然有许多团队的项目还在使用传统的  `frame`  布局，`Hotpot`是一个很轻量的过渡方案。



## 感谢

向 [](http://www.apple.com/) 和 [Masonry](https://github.com/SnapKit/Masonry) 致敬。