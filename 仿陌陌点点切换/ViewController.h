//
//  ViewController.h
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZLSwipeableView.h>
typedef NS_ENUM(NSInteger, HandleDirectionType) {
    HandleDirectionOn          = 0,
    HandleDirectionDown        = 1,
    HandleDirectionLeft        = 2,
    HandleDirectionRight       = 3,
};
@interface ViewController : UIViewController

@property (nonatomic, strong) ZLSwipeableView *swipeableView;
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView;
@end

