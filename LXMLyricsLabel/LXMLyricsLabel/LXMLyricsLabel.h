//
//  LXMLyricsLabel.h
//  LXMLyricsLabel
//
//  Created by luxiaoming on 15/9/8.
//  Copyright (c) 2015年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMLyricsLabel : UILabel

/**
 *  根据设置显示动画
 *
 *  @param timeArray     数组的内容是各个时间点，第一个必须是0，最后一个必须是总时间
 *  @param locationArray 对应各个时间点的位置，值从0~1，第一个必须是0，最后一个必须是1
 */
- (void)startLyricsAnimationWithTimeArray:(NSArray *)timeArray andLocationArray:(NSArray *)locationArray;


@end
