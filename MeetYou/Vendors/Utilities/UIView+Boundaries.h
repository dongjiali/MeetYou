//
//  UIView+Boundaries.h
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView (Boundaries)

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

- (void)setTop:(CGFloat)top duration:(CGFloat)duration;
- (void)setHeight:(CGFloat)height duration:(CGFloat)duration;

@end