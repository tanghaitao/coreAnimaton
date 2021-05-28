//
//  ViewController.m
//  核心动画第一讲02
//
//  Created by Dean on 2018/9/4.
//  Copyright © 2018年 tz. All rights reserved.
//

#define angleToRadians(angle) ((angle) / 180.0 *M_PI)//角度转弧度
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self test1];
}


- (void)test1{
    //    曲线
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 200)];
    [path addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(180, 100) controlPoint2:CGPointMake(200, 300)];
    //需要添加在layer上
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 60, 60);
    colorLayer.position = CGPointMake(50, 200);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    //    过山车的动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = path.CGPath;
//    anim.duration = 4.0f;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    anim.rotationMode = kCAAnimationRotateAuto;
//    [colorLayer addAnimation:anim forKey:nil];
//    改变大小
    CABasicAnimation *sizeAnim = [CABasicAnimation animation];
    sizeAnim.keyPath = @"transform.scale";
    sizeAnim.toValue = @.5;
//    sizeAnim.duration = 4.0;
//    sizeAnim.fillMode = kCAFillModeForwards;
//    sizeAnim.removedOnCompletion = NO;
//
//    [colorLayer addAnimation:sizeAnim forKey:nil];
    
//    修改颜色
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    CABasicAnimation *colorAnim = [CABasicAnimation animation];
    colorAnim.keyPath = @"backgroundColor";
    colorAnim.toValue = (id)color.CGColor;
//    colorAnim.duration = 4.0f;
//    colorAnim.fillMode = kCAFillModeForwards;
//    colorAnim.removedOnCompletion = NO;
//    [colorLayer addAnimation:colorAnim forKey:nil];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anim, sizeAnim, colorAnim];
    //重复的代码可以放到动画组里面。
    group.duration = 4.0f;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [colorLayer addAnimation:group forKey:nil];
    
    
}
- (void)test{
//    曲线
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 200)];
    [path addCurveToPoint:CGPointMake(300, 200) controlPoint1:CGPointMake(180, 100) controlPoint2:CGPointMake(200, 300)];
    
    CALayer *carLayer = [CALayer layer];
    carLayer.frame = CGRectMake(16, 200-30, 36, 36);
    carLayer.contents = (id)[UIImage imageNamed:@"car"].CGImage;
    carLayer.anchorPoint = CGPointMake(.5, .75);//一开始朝上一点，否则在线中心
    [self.view.layer addSublayer:carLayer];
//需要添加在layer上
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];//硬件加速，绘制更快
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = nil;//填充
    shapeLayer.strokeColor = [UIColor redColor].CGColor;//画笔
    [self.view.layer addSublayer:shapeLayer];
//    过山车的动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    anim.duration = 4.0f;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.rotationMode = kCAAnimationRotateAuto;//自动跟随path的方向走
    [carLayer addAnimation:anim forKey:nil];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.values = @[@angleToRadians(-6), @angleToRadians(6)];
//    anim.repeatCount = MAXFLOAT;
////    anim.duration = 1;//默认是0.5秒
//    anim.autoreverses = YES;//反转，
//    anim.speed = 2;
//    [_iconView.layer addAnimation:anim forKey:nil];
    
    [self test1];
}

@end
