//
//  ViewController.m
//  核心动画第一讲01
//
//  Created by Dean on 2018/9/4.
//  Copyright © 2018年 tz. All rights reserved.
//
/*
 
 
 
 动画三步骤：
 1.初始化动画对象
 2.设置需要修改的动画属性的值
 3.把动画添加到layer（所有的动画都是添加在layer上，不是view）
 
 你看到的都是假象，真正的view是没有发生变化的
 postition:（layer里面设置中心点） center:uiview
 presentationLayer和modelLayer（呈现层和模型层）
 
 锚点：1.概念；2.单位坐标0-1；3.和position的关系：就是锚点在父视图的位置
 
 隐式动画：默认时间0.25s(位置，颜色，大小),必须是独立的layer(不是uiview.layer)才有隐式动画，uiview（根layer）
 显示动画：
 */
#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_redView addGestureRecognizer:tap];
//    UIView *view = [UIView new];
////    view.layer.backgroundColor
////其实就是修改对应的layer的backgroundColor，模型层（存储数据和读取）,Vsync信号，每隔1/60秒的时间 重绘界面
//    view.backgroundColor = [UIColor yellowColor];
//    view.frame = CGRectMake(200, 0, 100, 100);
//
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(200, 0, 100, 100);
//可移植行。跨平台
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    _layer = layer;
    [self.view.layer addSublayer:layer];
    
    
}


- (void)tapAction:(UITapGestureRecognizer *)ges{
    NSLog(@"redview被点击了");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _redView.frame = CGRectMake(0, 400, 100, 100);//modelLayer
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";    
    
//    anim.toValue = @400;
//    anim.removedOnCompletion = NO;//默认会回到最初的位置
//    anim.fillMode = kCAFillModeForwards;//默认会回到最初的位置
    anim.delegate = self;//动画开始和结束时
    [_redView.layer addAnimation:anim forKey:nil];
    _layer.frame = CGRectMake(200, 400, 100, 100);
    
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"start-%@",NSStringFromCGRect(_redView.frame));
}

//hittest
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"stop-%@",NSStringFromCGRect(_redView.frame));
//    NSLog(@"stop-%@",NSStringFromCGRect(_redView.layer.presentationLayer.frame));
    NSLog(@"stop-%@",NSStringFromCGRect(_redView.layer.modelLayer.frame));


}
@end
