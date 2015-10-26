//
//  LXMLyricsLabel.m
//  LXMLyricsLabel
//
//  Created by luxiaoming on 15/9/8.
//  Copyright (c) 2015年 luxiaoming. All rights reserved.
//

#import "LXMLyricsLabel.h"

@interface LXMLyricsLabel ()

@property (nonatomic, strong, readwrite) UILabel *textLabel;
@property (nonatomic, strong, readwrite) UILabel *maskLabel;
@property (nonatomic, strong) CALayer *maskLayer;//用来控制maskLabel渲染的layer

@property (nonatomic, strong) UIColor *maskTextColor;
@property (nonatomic, strong) UIColor *maskBackgroundColor;

@end

@implementation LXMLyricsLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textLabel];
        [self addSubview:self.maskLabel];
        [self setupDefault];
    }
    return self;
}

- (void)setupDefault {
    self.maskTextColor = [UIColor orangeColor];
    self.maskBackgroundColor = [UIColor clearColor];
    
    self.maskLabel.textColor = self.maskTextColor;
    self.maskLabel.backgroundColor = self.maskBackgroundColor;
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.anchorPoint = CGPointMake(0, 0.5);//注意，按默认的anchorPoint，width动画是同时像左右扩展的
    maskLayer.position = CGPointMake(0, CGRectGetHeight(self.bounds) / 2);
    maskLayer.bounds = CGRectMake(0, 0, 0, CGRectGetHeight(self.bounds));
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.maskLabel.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
    
    
}

#pragma mark - publicMethod


- (void)setFont:(UIFont *)font {
    self.textLabel.font = font;
    self.maskLabel.font = font;
}

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
    self.maskLabel.text = text;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    self.textLabel.textAlignment = textAlignment;
    self.maskLabel.textAlignment = textAlignment;
}


- (void)startLyricsAnimationWithTimeArray:(NSArray *)timeArray andLocationArray:(NSArray *)locationArray {
    
    CGFloat totalDuration = [timeArray.lastObject floatValue];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.width"];
    NSMutableArray *keyTimeArray = [NSMutableArray array];
    NSMutableArray *widthArray = [NSMutableArray array];
    for (int i = 0 ; i < timeArray.count; i++) {
        CGFloat tempTime = [timeArray[i] floatValue] / totalDuration;
        [keyTimeArray addObject:@(tempTime)];
        CGFloat tempWidth = [locationArray[i] floatValue] * CGRectGetWidth(self.bounds);
        [widthArray addObject:@(tempWidth)];
    }
   
    animation.values = widthArray;
    animation.keyTimes = keyTimeArray;
    animation.duration = totalDuration;
    animation.calculationMode = kCAAnimationLinear;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.maskLayer addAnimation:animation forKey:@"kLyrcisAnimation"];
}

- (void)stopAnimation {
    [self.maskLayer removeAllAnimations];
}


#pragma mark - property

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _textLabel;
}

- (UILabel *)maskLabel {
    if (!_maskLabel) {
        _maskLabel = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _maskLabel;
}

@end
