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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
