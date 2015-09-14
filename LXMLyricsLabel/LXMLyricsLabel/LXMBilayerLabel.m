//
//  LXMBilayerLabel.m
//  LXMLyricsLabel
//
//  Created by luxiaoming on 15/9/14.
//  Copyright (c) 2015年 luxiaoming. All rights reserved.
//

#import "LXMBilayerLabel.h"

@interface LXMBilayerLabel ()

@property (nonatomic, strong) UILabel *maskLabel;
@property (nonatomic, strong) CALayer *maskLayer;//用来控制maskLabel渲染的layer

@property (nonatomic, strong) UIColor *maskTextColor;
@property (nonatomic, strong) UIColor *maskBackgroundColor;

@end

@implementation LXMBilayerLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
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
    
    CAGradientLayer *maskLayer = [CAGradientLayer layer];
    maskLayer.position = CGPointMake(-CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds) / 2);
    maskLayer.bounds = self.bounds;
    maskLayer.colors = @[(id)[UIColor clearColor].CGColor,
                         (id)[UIColor whiteColor].CGColor,
                         (id)[UIColor clearColor].CGColor,];
    maskLayer.startPoint = CGPointMake(0, 0.5);
    maskLayer.endPoint = CGPointMake(1, 0.5);
    self.maskLabel.layer.mask = maskLayer;
//    [self.maskLabel.layer addSublayer:maskLayer];
    self.maskLayer = maskLayer;
    
    
}

#pragma mark - publicMethod

- (void)startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.toValue = @(CGRectGetWidth(self.bounds) / 2 * 3);
    animation.duration = 2;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    animation.repeatCount = NSIntegerMax;
    [self.maskLayer addAnimation:animation forKey:@"kLXMShimmerAnimation"];
}

- (void)stopAnimation {
    [self.maskLayer removeAllAnimations];
}


#pragma mark - setter

- (void)setText:(NSString *)text {
    [super setText:text];
    self.maskLabel.text = text;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.maskLabel.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    [self.maskLabel setTextAlignment:textAlignment];
}





#pragma mark - property

- (UILabel *)maskLabel {
    if (!_maskLabel) {
        _maskLabel = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _maskLabel;
}

@end
