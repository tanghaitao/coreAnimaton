//
//  DNBlackViewController.m
//  自定义转场动画02
//
//  Created by Dean on 2018/9/9.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "DNBlackViewController.h"
#import "DNCircleTransition.h"

@interface DNBlackViewController ()<UINavigationControllerDelegate>

@end

@implementation DNBlackViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        DNCircleTransition *trans = [DNCircleTransition new];
        trans.isPush = NO;
        return trans;
    }else{
        return nil;
    }
}
@end
