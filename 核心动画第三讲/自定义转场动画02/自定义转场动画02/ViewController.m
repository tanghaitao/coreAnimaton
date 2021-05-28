//
//  ViewController.m
//  自定义转场动画02
//
//  Created by Dean on 2018/9/9.
//  Copyright © 2018年 tz. All rights reserved.
//

/*
 1.实现相关转场动画协议
 2.就是添加转场动画
 */
#import "ViewController.h"
#import "DNCircleTransition.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UINavigationControllerDelegate
//就是告诉nav，我不需要自带的转场动画了，我想自定义转场动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        DNCircleTransition *trans = [DNCircleTransition new];
        trans.isPush = YES;
        return trans;
    }else{
        return nil;
    }
}

@end
