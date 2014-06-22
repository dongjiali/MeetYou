//
//  UIView+Boundaries.m
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UIView+Boundaries.h"
@implementation UIView (Boundaries)

@dynamic top;
@dynamic bottom;
@dynamic left;
@dynamic right;
@dynamic width;
@dynamic height;

#pragma mark - getter
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)right
{
    return self.left + self.width;
}

- (CGFloat)bottom
{
    return self.top + self.height;
}


#pragma mark - setter
- (void)setLeft:(CGFloat)left
{
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (void)setTop:(CGFloat)top
{
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

- (void)setRight:(CGFloat)right
{
    self.frame = CGRectMake(self.left, self.top, right - self.left, self.height);
}

- (void)setBottom:(CGFloat)bottom
{
    self.frame = CGRectMake(self.left, self.top, self.width, bottom - self.top);
}


#pragma mark - Actions
- (void)setTop:(CGFloat)top duration:(CGFloat)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.top = top;
    } completion:^(BOOL finished) {
        if ([self isKindOfClass:[UINavigationBar class]] && top == -44.0f && finished)
            self.hidden = YES;
    }];
}

- (void)setHeight:(CGFloat)height duration:(CGFloat)duration
{
    [UIView animateWithDuration:duration animations:^{
        self.height = height;
    } completion:^(BOOL finished) {
    }];
}

@end