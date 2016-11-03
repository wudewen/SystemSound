//
//  ViewController.m
//  控制系统的音量
//
//  Created by 吴德文 on 16/10/12.
//  Copyright © 2016年 XiangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "SettingSound.h"

@interface ViewController ()

@property (nonatomic,strong)UISlider *mySlider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [SettingSound getSystemVolumSlider];
//    
//    [SettingSound getSystemVolumValue];
    
    //[SettingSound setSysVolumWith:0.5];
    
    [self creatSlider];
}

-(void)creatSlider
{
    self.view.backgroundColor = [UIColor blackColor];
    
    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 600, 375, 50)];
    self.mySlider.center = self.view.center;
    self.mySlider.minimumValue = 0.0f;//滑动条的最小值
    self.mySlider.maximumValue = 1.0f;//滑动条的最大值
    // 设置slider滑球的颜色
    self.mySlider.thumbTintColor = [UIColor redColor];
    // 设置slider划过去的线的颜色
    self.mySlider.minimumTrackTintColor = [UIColor blueColor];
    // 设置slider未划过去的颜色
    self.mySlider.maximumTrackTintColor = [UIColor yellowColor];
    self.mySlider.value = self.mySlider.maximumValue/2.0;//滑动条的当前值
    [self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];//添加滑动事件
    self.mySlider.continuous = NO;//设置只有在离开滑动条的最后时刻才触发滑动事件
//    // 设置slider左边的图片
//    self.mySlider.minimumValueImage = [UIImage imageNamed:@"reduce"];
//    // 设置slider右边的图片
//    self.mySlider.maximumValueImage = [UIImage imageNamed:@"add"];
//    [self.mySlider setThumbImage:[UIImage imageNamed:@"slider"] forState:UIControlStateHighlighted];//设置滑动的时候显示的图片
    [self.view addSubview:self.mySlider];//添加视图
}

//添加滑动事件
-(void)sliderValueChanged:(UISlider *)paramSender
{
    if ([paramSender isEqual:self.mySlider])
    {
        [SettingSound setSysVolumWith:paramSender.value];

        NSLog(@"New value=%f",paramSender.value);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
