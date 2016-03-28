//
//  HistoryViewController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (nonatomic, strong) NSString *rightNavBarButtonItemTitle;
@property (nonatomic, strong) UIBarButtonItem *rightNavBarButtonItem;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swipeableView.numberOfHistoryItem = NSUIntegerMax;
    self.swipeableView.allowedDirection = ZLSwipeableViewDirectionAll;
    
    self.rightNavBarButtonItemTitle = @"Rewind";
    self.rightNavBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:self.rightNavBarButtonItemTitle
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = _rightNavBarButtonItem;
    [self updateRightBarButtonItem];
}

- (void)updateRightBarButtonItem {
    NSUInteger historyLength = self.swipeableView.history.count;
    BOOL enabled = historyLength != 0;
    self.navigationItem.rightBarButtonItem.enabled = enabled;
    if (!enabled) {
        self.navigationItem.rightBarButtonItem.title = self.rightNavBarButtonItemTitle;
        return;
    }
    self.navigationItem.rightBarButtonItem.title =
    [NSString stringWithFormat:@"%@(%lu)", self.rightNavBarButtonItemTitle, historyLength];
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    [self updateRightBarButtonItem];
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)barButtonItem {
    [self.swipeableView rewind];
    [self updateRightBarButtonItem];
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
