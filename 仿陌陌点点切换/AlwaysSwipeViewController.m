//
//  AlwaysSwipeViewController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "AlwaysSwipeViewController.h"

@interface AlwaysSwipeViewController ()<ZLSwipeableViewSwipingDeterminator>

@end

@implementation AlwaysSwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swipeableView.swipingDeterminator = self;
}

- (BOOL)shouldSwipeView:(UIView *)view
               movement:(ZLSwipeableViewMovement *)movement
          swipeableView:(ZLSwipeableView *)swipeableView {
    return YES;
}

@end
