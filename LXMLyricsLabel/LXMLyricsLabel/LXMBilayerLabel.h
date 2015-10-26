//
//  LXMBilayerLabel.h
//  LXMLyricsLabel
//
//  Created by luxiaoming on 15/9/14.
//  Copyright (c) 2015年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMBilayerLabel : UIView

@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, strong, readonly) UILabel *maskLabel;

- (void)setFont:(UIFont *)font;

- (void)setText:(NSString *)text;

- (void)setTextAlignment:(NSTextAlignment)textAlignment;


- (void)startAnimation;

- (void)stopAnimation;

@end
