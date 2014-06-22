//
//  MTRequestSerializer.m
//  MeetYou
//
//  Created by Curry on 14-5-18.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "MTRequestSerializer.h"

@implementation MTRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [super requestWithMethod:method URLString:URLString parameters:parameters];
    request.timeoutInterval = NetWork_TimeOut;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    return request;
}

@end
