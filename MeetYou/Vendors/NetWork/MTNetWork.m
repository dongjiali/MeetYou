//
//  MTNetWork.m
//  MeetYou
//
//  Created by Curry on 14-5-18.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "MTNetWork.h"
#import "MTRequestSerializer.h"
@interface MTNetWork()
@property (nonatomic,strong)NSURLSessionDataTask *dataTask;
@property (nonatomic,strong)AFHTTPRequestOperationManager *requestOperationManager;
@end
@implementation MTNetWork

- (id)init
{
    if (self = [super init]) {
        self.showLoadingView = YES;
        self.loadCooikes = YES;
        self.requestOperationManager = [AFHTTPRequestOperationManager manager];
        [_requestOperationManager setRequestSerializer:[MTRequestSerializer serializer]];
         //        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithSessionConfiguration:configuration];
//        [_requestOperationManager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
        //        [_requestOperationManager setSecurityPolicy:[self customSecurityPolicy]]; add SSL
        
    }
    return self;
}


- (void)getHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure
{
    [_requestOperationManager GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)postHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure
{
    [_requestOperationManager POST:URL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)putHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure
{
    [_requestOperationManager PUT:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)deleteHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure
{
    [_requestOperationManager DELETE:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//获取网络状态

- (void )reachabilityStatusChangeBlock:(void (^)(AFNetworkReachabilityStatus status))completion;
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        completion(status);
    }];
}

- (void)isReachable:(void (^)(BOOL ))block
{
    [self reachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi);
    }];
}

- (void)isReachableViaWWAN:(void (^)(BOOL))block
{
    [self reachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block (status == AFNetworkReachabilityStatusReachableViaWWAN);
    }];
}

- (void)isReachableViaWiFi:(void (^)(BOOL))block
{
    [self reachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block (status == AFNetworkReachabilityStatusReachableViaWiFi);
    }];
}

@end