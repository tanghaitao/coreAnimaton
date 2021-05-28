//
//  ViewController.m
//  核心动画第一讲03
//
//  Created by Dean on 2018/9/4.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, assign) NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _imgs = @[@"view0", @"view1" ,@"view2"];
    _index = 0;
    
//    [self test];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _index++;
    if (_index == 3) {
        _index = 0;
    }
    NSString *imgName = _imgs[_index];
    _imgView.image = [UIImage imageNamed:imgName];
    CATransition *anim = [CATransition animation];
    anim.type = @"pageCurl";
    anim.duration = .5;
//    anim.startProgress = .2;
//    anim.endProgress = .5;
    [_imgView.layer addAnimation:anim forKey:nil];
    
}


@end
