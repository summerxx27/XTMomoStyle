//
//  CustomAnimationController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "CustomAnimationController.h"

@interface CustomAnimationController ()<ZLSwipeableViewAnimator>

@end

@implementation CustomAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // numbers
    self.swipeableView.numberOfActiveViews = 10;
    self.swipeableView.viewAnimator = self;
}
- (void)animateView:(UIView *)view
              index:(NSUInteger)index
              views:(NSArray<UIView *> *)views
      swipeableView:(ZLSwipeableView *)swipeableView {
    CGFloat degree = sin(0.5 * index);
    NSTimeInterval duration = 0.4;
    CGPoint offset = CGPointMake(0, CGRectGetHeight(swipeableView.bounds) * 0.3);
    CGPoint translation = CGPointMake(degree * 10.0, -(index * 5.0));
    [self rotateAndTranslateView:view
                       forDegree:degree
                     translation:translation
                        duration:duration
              atOffsetFromCenter:offset
                   swipeableView:swipeableView];
}

- (CGFloat)degreesToRadians:(CGFloat)degrees {
    return degrees * M_PI / 180;
}

- (CGFloat)radiansToDegrees:(CGFloat)radians {
    return radians * 180 / M_PI;
}

- (void)rotateAndTranslateView:(UIView *)view
                     forDegree:(float)degree
                   translation:(CGPoint)translation
                      duration:(NSTimeInterval)duration
            atOffsetFromCenter:(CGPoint)offset
                 swipeableView:(ZLSwipeableView *)swipeableView {
    float rotationRadian = [self degreesToRadians:degree];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         view.center = [swipeableView convertPoint:swipeableView.center
                                                          fromView:swipeableView.superview];
                         CGAffineTransform transform =
                         CGAffineTransformMakeTranslation(offset.x, offset.y);
                         transform = CGAffineTransformRotate(transform, rotationRadian);
                         transform = CGAffineTransformTranslate(transform, -offset.x, -offset.y);
                         transform =
                         CGAffineTransformTranslate(transform, translation.x, translation.y);
                         view.transform = transform;
                     }
                     completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
