//
//  UserInfoDataManager.h
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *
 */
#define UserInfoManager [UserInfoDataManager shareManager]
/*
 *
 */
@interface UserInfoDataManager : NSObject
#pragma mark - FirstOpenApp
@property (nonatomic, assign) BOOL hasFirstOpenApp;// 服务器数据有更新标识位
#pragma mark - deviceToken
@property (nonatomic, strong) NSString *deviceToken;// 服务器数据有更新标识位
#pragma mark - serverInfoStatus
@property (nonatomic, assign) CGFloat hasServerInfoUpdated;// 服务器数据有更新标识位
#pragma mark - locationInfoStatus
@property (nonatomic, assign) CGFloat hasPassengerUpdated;   // 本地常用联系数据有更新标识位
@property (nonatomic, assign) CGFloat hasCityListUpdated;      // 本地城市列表数据有更新标识位
@property (nonatomic, assign) CGFloat hasNationListUpdated;      // 本地国家列表数据有更新标识位
@property (nonatomic, assign) CGFloat hasAirLinesUpdated;      // 本地航空公司数据有更新标识位
@property (nonatomic, assign) CGFloat hasRulesUpdated;      // 本地机票退改签数据有更新标识位
@property (nonatomic, assign) CGFloat hasAirPortUpdated;      // 本地机场数据有更新标识位
#pragma mark - userInfoStatus
@property (nonatomic, assign) BOOL hasAccountInfoUpdated;// 账户信息标识位
@property (nonatomic, assign) BOOL hasStartMainBackGroundView;// 隐藏背影
@property (nonatomic, assign) BOOL hasNetWrokingRuning;// 隐藏背影
@property (nonatomic, assign) BOOL hasPersonalInfoUpdated;// 个人信息标识位

#pragma mark - userAccountInfo
@property (nonatomic, strong) NSString *userName;// 用户名－账号－注册手机号
@property (nonatomic, strong) NSString *password;// 密码
@property (nonatomic, assign) BOOL isLogin;// 用户登录状态
@property (nonatomic, strong) NSString *contactsName;// 联系人姓名
@property (nonatomic, strong) NSString *contactsPhone;// 联系人电话
@property (nonatomic, assign) BOOL hasRememberedPassword;// 记住密码标识位

#pragma -mark- Order
//订单成功
@property (nonatomic, strong) NSNumber *hasTicketOrderSuccessCounts; //订票成功
@property (nonatomic, strong) NSNumber *hasTicketOrderFailureCounts; //订票失败
@property (nonatomic, strong) NSString *hasTicketOrderStatus;   // 记录订票状态

#pragma mark - userPersonalInfo
@property (nonatomic, strong) NSString *name;// 姓名－个人信息
@property (nonatomic, strong) NSString *gender;// 性别－个人信息
@property (nonatomic, strong) NSString *email;// 邮箱－个人信息
@property (nonatomic, strong) NSString *address;// 地址－个人信息

#pragma mark - Methods
+ (instancetype)shareManager;

- (void)updateUserAccountInfoWithUserName:(NSString *)userName password:(NSString *)password isLogin:(BOOL)isLogin;// updateUserAccountInfo
- (void)updatePersonalInfoWithName:(NSString *)name gender:(NSString *)gender email:(NSString *)email address:(NSString *)address;// updatePersonalInfo

@end
