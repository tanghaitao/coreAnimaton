//
//  ViewController.m
//  核心动画第三讲03
//
//  Created by Dean on 2018/9/9.
//  Copyright © 2018年 tz. All rights reserved.
//

/*
 1.6个面（layer）
 2.layer做一个3d转换（平移、旋转）
 3.通过CATransform3D在变换
 4.把每个面的layer再添加到CATransformLayer
 5.把CATransformLayer添加在self.view.layer上
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self tranform3D];
}


- (void)tranform3D{
    CATransformLayer *cubeLayer = [CATransformLayer layer];
    
    //1(上)
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    //2（右）
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    //3.（后）
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    //4.（前）
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    //5.（左）
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    //6.(下)
    ct = CATransform3DMakeTranslation(0, 0, -50);
    [cubeLayer addSublayer:[self faceWithTransform:ct]];
    
    cubeLayer.position = self.view.center;
    cubeLayer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
    [self.view.layer addSublayer:cubeLayer];
}

- (CALayer *)faceWithTransform:(CATransform3D)transform{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    layer.backgroundColor = color.CGColor;
    layer.transform = transform;
    return layer;
}
@end
