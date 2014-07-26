//
//  CommendTermFindMocel.m
//  MeetYou
//
//  Created by Curry on 14-7-13.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendTermFindMocel.h"

@implementation CommendTermFindMocel

- (id)init
{
    if (self = [super init]) {
        self.age = @"不限";
        self.education = @"不限";
        self.region = @"不限";
    }
    return  self;
}

- (void)dealloc
{
    self.age = nil;
    self.education = nil;
    self.region = nil;
}

@end
