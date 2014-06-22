//
//  MTNetWork.h
//  MeetYou
//
//  Created by Curry on 14-5-18.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTNetWork : NSObject
//is show loading View
@property ( nonatomic, assign, getter = isShowLoadingView) BOOL showLoadingView;
//is load cookies
@property ( nonatomic, assign, getter = isLoadCooikes) BOOL loadCooikes;
//request json model
@property (nonatomic, assign, getter = isJsonRequestSerializer) BOOL jsonRequestSerializer;
//response json model
@property (nonatomic, assign, getter = isJsonResponseSerializer) BOOL jsonResponseSerializer;

#pragma -mark- network status
- (void)isReachable:(void (^)(BOOL flag))block;                         //check networking
- (void)isReachableViaWWAN:(void (^)(BOOL flag))block;          //check 3g
- (void)isReachableViaWiFi:(void (^)(BOOL flag))block;              //check wifi

#pragma -mark- http or https request
//http get method request
- (void)getHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure;
//http pot method request
- (void)postHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure;
//http put method request
- (void)putHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure;
//http delete method request
- (void)deleteHttpURL:(NSString *)URL parameters:(NSDictionary *)params completion:(void (^)(id results))completion failure:(void (^)(NSError *error))failure;
//http upload method request
- (void)sendUploadRequest:(NSDictionary *)valueDic Data:(NSData *)data progress:(NSProgress * __autoreleasing *)progress completion:( void (^)(NSDictionary *results, NSError *error) )completion;
//http download method request
- (void)sendDownloadRequest:(NSDictionary *)valueDic progress:(NSProgress * __autoreleasing *)progress completion:( void (^)(NSURL *filePath, NSError *error) )completion;
@end
