//
//  LoadPreViousViewController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "LoadPreViousViewController.h"

@interface LoadPreViousViewController ()

@property (nonatomic, strong) NSString *rightNavBarButtonItemTitle;
@property (nonatomic, strong) UIBarButtonItem *rightNavBarButtonItem;

@end

@implementation LoadPreViousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swipeableView.numberOfHistoryItem = NSUIntegerMax;
    self.swipeableView.allowedDirection = ZLSwipeableViewDirectionAll;
    
    self.rightNavBarButtonItemTitle = @"Load Previous";
    self.rightNavBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:self.rightNavBarButtonItemTitle
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = _rightNavBarButtonItem;
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)barButtonItem {
    [self.swipeableView rewind];
}

- (UIView *)previousViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    UIView *view = [self nextViewForSwipeableView:swipeableView];
    [self applyRandomTransform:view];
    return view;
}

- (void)applyRandomTransform:(UIView *)view {
    CGFloat width = self.swipeableView.bounds.size.width;
    CGFloat height = self.swipeableView.bounds.size.height;
    CGFloat distance = MAX(width, height);
    
    CGAffineTransform transform = CGAffineTransformMakeRotation([self randomRadian]);
    transform = CGAffineTransformTranslate(transform, distance, 0);
    transform = CGAffineTransformRotate(transform, [self randomRadian]);
    view.transform = transform;
}

- (CGFloat)randomRadian {
    return (random() % 360) * (M_PI / 180.0);
}

@end
