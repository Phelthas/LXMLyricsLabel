//
//  ViewController.m
//  LXMLyricsLabel
//
//  Created by luxiaoming on 15/9/8.
//  Copyright (c) 2015年 luxiaoming. All rights reserved.
//

#import "ViewController.h"
#import "LXMLyricsLabel.h"
#import "LXMBilayerLabel.h"

@interface ViewController ()

@property (nonatomic, strong) LXMLyricsLabel *lyricsLabel;
@property (nonatomic, strong) LXMBilayerLabel *bilayerLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LXMLyricsLabel *lyricsLabel = [[LXMLyricsLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    lyricsLabel.center = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2, 200);
    lyricsLabel.backgroundColor = [UIColor lightGrayColor];
    lyricsLabel.textLabel.textColor = [UIColor whiteColor];
    lyricsLabel.font = [UIFont systemFontOfSize:14];
    lyricsLabel.text = @"向前跑！迎着冷眼和嘲笑";//@"knocking on heaven's door";
    lyricsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lyricsLabel];
    self.lyricsLabel = lyricsLabel;
    
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    playButton.center = self.view.center;
    playButton.backgroundColor = [UIColor purpleColor];
    [playButton setTitle:@"play" forState:UIControlStateNormal];
    [playButton setTitle:@"stop" forState:UIControlStateSelected];
    [playButton addTarget:self action:@selector(handlePlayButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    LXMBilayerLabel *bilayerLabel =  [[LXMBilayerLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    bilayerLabel.center = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2, 200 + 30);
    bilayerLabel.backgroundColor = [UIColor lightGrayColor];
    bilayerLabel.textLabel.textColor = [UIColor whiteColor];
    bilayerLabel.font = [UIFont systemFontOfSize:14];
    bilayerLabel.text = @"knocking on heaven's door";
    bilayerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:bilayerLabel];
    self.bilayerLabel = bilayerLabel;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - buttonAction 

- (void)handlePlayButtonTapped:(UIButton *)sender {
    NSArray *timeArray = @[
                           @(0),
                           @(3),
                           @(3.3),
                           @(3.6),
                           @(4)
                           ];
    NSArray *locationArray = @[
                               @(0),
                               @(0.4),
                               @(0.6),
                               @(0.8),
                               @(1)
                               ];

    
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.bilayerLabel startAnimation];
        [self.lyricsLabel startLyricsAnimationWithTimeArray:timeArray andLocationArray:locationArray];
    } else {
        [self.bilayerLabel stopAnimation];
        [self.lyricsLabel stopAnimation];
    }
    
}

@end
