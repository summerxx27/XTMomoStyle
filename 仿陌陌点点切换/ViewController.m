//
//  ViewController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "ViewController.h"
#import <ZLSwipeableView.h>
#import "UIColor+FlatColors.h"
#import "CardView.h"

@interface ViewController ()<ZLSwipeableViewDelegate, ZLSwipeableViewDataSource>

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger colorIndex;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.colorIndex = 0;
    self.colors = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos"
                    ];
    self.titles = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos"
                    ];
    
    
    [self.view addSubview:self.swipeableView];
    ZLSwipeableView *swipeableView = _swipeableView;
    // Required Data Source
    self.swipeableView.dataSource = self;
    
    // Optional Delegate
    self.swipeableView.delegate = self;
    
    self.swipeableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *metrics = @{};
    // Adding constraints
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"|-15-[swipeableView]-15-|"
                               options:0
                               metrics:metrics
                               views:NSDictionaryOfVariableBindings(
                                                                    swipeableView)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-120-[swipeableView]-100-|"
                               options:0
                               metrics:metrics
                               views:NSDictionaryOfVariableBindings(
                                                                    swipeableView)]];
    
    
    // `1` `2` `3` `4`
    NSArray *items = @[@"😢", @"😄", @"😢", @"😄"];
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(50 + 60 * i, self.view.frame.size.height - 90, 50, 50);
        [button setTitle:items[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

// up down left right
- (void)handle:(UIButton *)sender
{
    HandleDirectionType type = sender.tag;
    switch (type) {
        case HandleDirectionOn:
            [self.swipeableView swipeTopViewToUp];
            break;
        case HandleDirectionDown:
            [self.swipeableView swipeTopViewToDown];
            break;
        case HandleDirectionLeft:
            [self.swipeableView swipeTopViewToLeft];
            break;
            
        case HandleDirectionRight:
            [self.swipeableView swipeTopViewToRight];
            break;
        default:
            break;
    }
}

- (ZLSwipeableView *)swipeableView
{
    if (_swipeableView == nil) {
        _swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
    }
    return _swipeableView;
}

- (void)viewDidLayoutSubviews
{
    [self.swipeableView loadViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate
- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction
{
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view
{
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location
{
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation
{
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location
{
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView
{
    if (self.colorIndex >= self.colors.count || self.colorIndex >= self.titles.count) {
        self.colorIndex = 0;
    }
    
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    // colors
    view.backgroundColor = [self colorForName:self.colors[self.colorIndex]];
    view.backgroundColor = [UIColor purpleColor];
    // titles
    view.labelTitle.text = self.titles[self.colorIndex];
    // ++
    self.colorIndex++;
    return view;
}

#pragma mark - color
- (UIColor *)colorForName:(NSString *)name
{
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}
@end
