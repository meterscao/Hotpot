
#### How To Use

Import header files like this:

	#import "Hotpot.h"


Your frame layout code should be placed in `viewDidLayoutSubviews` or `viewDidLayout`, this is a `objctive-c` code sample:

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


#### Install

The best way to use `Hotpot` in your project is using [Cocoapods](http://cocoapods.org):

	platform: ios , '7.0'
	pod 'Hotpot'
	
**Important**: You must specify the number of version to your iOS platform. 