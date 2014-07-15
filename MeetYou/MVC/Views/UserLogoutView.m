//
//  UserLogoutView.m
//  MeetYou
//
//  Created by Curry on 14-6-27.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserLogoutView.h"

@implementation UserLogoutView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化时加载xib文件
        NSArray *xibArr = [[NSBundle mainBundle] loadNibNamed:@"UserLogoutView" owner:self options:nil];
        self = xibArr[0];
    }
    return self;
}
@end
