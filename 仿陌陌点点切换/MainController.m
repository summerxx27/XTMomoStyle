//
//  MainController.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "MainController.h"
#import "ViewController.h"
#import "CustomAnimationController.h"
#import "AllowedDirectionDemoViewController.h"
#import "HistoryViewController.h"
#import "LoadPreViousViewController.h"
#import "AlwaysSwipeViewController.h"
#define cellIdentifier @"identifier"
@interface MainController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *types;
@end

@implementation MainController
- (NSArray *)types
{
    if (_types == nil) {
        _types = @[@"normal", @"custom", @"allowDirection", @"History", @"LoadPrevious", @"AlwaySwipe"];
    }
    return _types;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = self.types[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            ViewController *view = [[ViewController alloc] init];
            [self.navigationController pushViewController:view animated:YES];
        }
            break;
        case 1:
        {
            CustomAnimationController *custom = [[CustomAnimationController alloc] init];
            [self.navigationController pushViewController:custom animated:YES];
        }
            break;
        case 2:
        {
            AllowedDirectionDemoViewController *allow = [[AllowedDirectionDemoViewController alloc] init];
            [self.navigationController pushViewController:allow animated:YES];
        }
            break;
        case 3:
        {
            HistoryViewController *history = [[HistoryViewController alloc] init];
            [self.navigationController pushViewController:history animated:YES];
        }
            break;
        case 4:
        {
            LoadPreViousViewController *load = [[LoadPreViousViewController alloc] init];
            [self.navigationController pushViewController:load animated:YES];
        }
            break;
        case 5:
        {
            AlwaysSwipeViewController *alwaysSwipe = [[AlwaysSwipeViewController alloc] init];
            [self.navigationController pushViewController:alwaysSwipe animated:YES];
        }
        default:
            break;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

@end
