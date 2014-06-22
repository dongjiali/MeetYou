//
//  UserInfoDataManager.m
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserInfoDataManager.h"

#define UserStandardDefaults [NSUserDefaults standardUserDefaults]
#define HasFirstOpenApp @"hasFirstOpenApp"// 服务器是否有更新数据
#define HasServerInfoUpdated @"hasServerInfoUpdated"// 服务器是否有更新数据
#define HasPassengerUpdated @"hasPassengerUpdated"// 本地常用联系数据有更新标识位
#define HasCityListUpdated @"hasCityListUpdated"// 本地城市列表数据有更新标识位
#define HasNationListUpdated @"hasNationListUpdated"// 本地城市列表数据有更新标识位
#define HasAirLinesUpdated @"hasAirLinesUpdated"// 本地航空公司数据有更新标识位
#define HasAirPortUpdated @"hasAirPortUpdated"//  本地机场数据有更新标识位
#define HasRulesUpdated   @"hasRulesUpdated" // 本地机票退改签数据有更新标识位
#define HasTicketOrderStatus @"hasTicketOrderStatus" //
#define HasNetWrokingRuning @"hasNetWrokingRuning" //判断网络
#define HasStartMainBackGroundView @"hasStartMainBackGroundView" //启动页起飞标志
#define HasTicketOrderSuccessCounts @"hasTicketOrderSuccessCounts"//订票成功
#define HasTicketOrderFailureCounts @"hasTicketOrderFailureCounts" //订票失败

#define HasRememberedPassword @"hasrememberedpassword"// 记住密码
#define UserName @"username"// 账号
#define ContactsName @"contactsName"// 密码
#define ContactsPhone @"contactsPhone"// 账号
#define Password @"password"// 密码
#define IsLogin @"islogin"// 登录状态
#define Name @"name"// 姓名
#define Gender @"gender"// 性别
#define Email @"email"// 邮箱
#define Address @"address"// 地址
#define deviceTokenInfo @"deviceTokenInfo"// deviceToken
/*
 *
 */

@implementation UserInfoDataManager

// shareManager
+ (instancetype)shareManager
{
    static UserInfoDataManager *userInfoManager = nil;
    if (userInfoManager == nil) {
        userInfoManager = [[UserInfoDataManager alloc] init];
    }
    return userInfoManager;
}

// updateUserAccountInfo
- (void)updateUserAccountInfoWithUserName:(NSString *)userName password:(NSString *)password isLogin:(BOOL)isLogin
{
    [UserStandardDefaults setObject:userName forKey:UserName];
    [UserStandardDefaults setObject:password forKey:Password];
    [UserStandardDefaults setBool:isLogin forKey:IsLogin];
    [UserStandardDefaults synchronize];
    
    _userName = [UserStandardDefaults objectForKey:UserName];
    _password = [UserStandardDefaults objectForKey:Password];
    _isLogin = [UserStandardDefaults boolForKey:IsLogin];
    
    _hasAccountInfoUpdated = YES;
    _hasPersonalInfoUpdated = NO;
}

// updatePersonalInfo
- (void)updatePersonalInfoWithName:(NSString *)name gender:(NSString *)gender email:(NSString *)email address:(NSString *)address
{
    [UserStandardDefaults setObject:name forKey:Name];
    [UserStandardDefaults setObject:gender forKey:Gender];
    [UserStandardDefaults setObject:email forKey:Email];
    [UserStandardDefaults setObject:address forKey:Address];
    [UserStandardDefaults synchronize];
    
    _name = [UserStandardDefaults objectForKey:Name];
    _gender = [UserStandardDefaults objectForKey:Gender];
    _email = [UserStandardDefaults objectForKey:Email];
    _address = [UserStandardDefaults objectForKey:Address];
    
    _hasPersonalInfoUpdated = YES;
}


#pragma mark - getter - userAccountInfo
- (NSString *)userName {
    if (_hasAccountInfoUpdated) {
        return _userName;
    }
    return [UserStandardDefaults objectForKey:UserName];
}

- (NSString *)password {
    if (_hasAccountInfoUpdated) {
        return _password;
    }
    return [UserStandardDefaults objectForKey:Password];
}

- (BOOL)isLogin {
    if (_hasAccountInfoUpdated) {
        return _isLogin;
    }
    return [UserStandardDefaults boolForKey:IsLogin];
}

#pragma mark - getter - userPersonalInfo
- (NSString *)name {
    if (_hasPersonalInfoUpdated) {
        return _name;
    }
    return [UserStandardDefaults objectForKey:Name];
}
- (NSString *)gender {
    if (_hasPersonalInfoUpdated) {
        return _gender;
    }
    return [UserStandardDefaults objectForKey:Gender];
}
- (NSString *)email {
    if (_hasPersonalInfoUpdated) {
        return _email;
    }
    return [UserStandardDefaults objectForKey:Email];
}
- (NSString *)address {
    if (_hasPersonalInfoUpdated) {
        return _address;
    }
    return [UserStandardDefaults objectForKey:Address];
}


#pragma mark - getter - hasRememberedPassword
- (BOOL)hasRememberedPassword {
    return [UserStandardDefaults boolForKey:HasRememberedPassword];
}

#pragma mark - setter - hasRememberedPassword
- (void)setHasRememberedPassword:(BOOL)hasRememberedPassword {
    [UserStandardDefaults setBool:hasRememberedPassword forKey:HasRememberedPassword];
    [UserStandardDefaults synchronize];
}

#pragma mark - getter - hasServerInfoUpdated
- (CGFloat)hasServerInfoUpdated {
    return [UserStandardDefaults floatForKey:HasServerInfoUpdated];
}
#pragma mark - setter - hasServerInfoUpdated
- (void)setHasServerInfoUpdated:(CGFloat)hasServerInfoUpdated {
    [UserStandardDefaults setFloat:hasServerInfoUpdated forKey:HasServerInfoUpdated];
    [UserStandardDefaults synchronize];
}

#pragma mark - getter - hasLocationInfoUpdated
- (CGFloat)hasPassengerUpdated
{
    return [UserStandardDefaults floatForKey:HasPassengerUpdated];
}
- (void)setHasPassengerUpdated:(CGFloat)hasPassengerUpdated
{
    [UserStandardDefaults setFloat:hasPassengerUpdated forKey:HasPassengerUpdated];
    [UserStandardDefaults synchronize];
}
- (CGFloat)hasCityListUpdated
{
    return [UserStandardDefaults floatForKey:HasCityListUpdated];
}
- (void)setHasCityListUpdated:(CGFloat)hasCityListUpdated
{
    [UserStandardDefaults setFloat:hasCityListUpdated forKey:HasCityListUpdated];
    [UserStandardDefaults synchronize];
}

- (CGFloat)hasAirLinesUpdated
{
    return [UserStandardDefaults floatForKey:HasAirLinesUpdated];
}

- (void)setHasAirLinesUpdated:(CGFloat)hasAirLinesUpdated
{
    [UserStandardDefaults setFloat:hasAirLinesUpdated forKey:HasAirLinesUpdated];
    [UserStandardDefaults synchronize];
}
- (CGFloat)hasAirPortUpdated
{
    return [UserStandardDefaults floatForKey:HasAirPortUpdated];
}
- (void)setHasAirPortUpdated:(CGFloat)hasAirPortUpdated
{
    [UserStandardDefaults setFloat:hasAirPortUpdated forKey:HasAirPortUpdated];
    [UserStandardDefaults synchronize];
}
- (CGFloat)hasNationListUpdated
{
    return [UserStandardDefaults floatForKey:HasNationListUpdated];
}
- (void)setHasNationListUpdated:(CGFloat)hasNationListUpdated
{
    [UserStandardDefaults setFloat:hasNationListUpdated forKey:HasNationListUpdated];
    [UserStandardDefaults synchronize];
}

- (CGFloat)hasRulesUpdated
{
    return [UserStandardDefaults floatForKey:HasRulesUpdated];
}

- (void)setHasRulesUpdated:(CGFloat)hasRulesUpdated
{
    [UserStandardDefaults setFloat:hasRulesUpdated forKey:HasRulesUpdated];
    [UserStandardDefaults synchronize];
}

#pragma -mark- first open app
- (BOOL)hasFirstOpenApp
{
    if(![UserStandardDefaults boolForKey:HasFirstOpenApp]){
        [UserStandardDefaults setBool:YES forKey:HasFirstOpenApp];
        return YES;
    }else
        return NO;
}

- (BOOL)hasStartMainBackGroundView
{
    return [UserStandardDefaults boolForKey:HasStartMainBackGroundView];
}

- (void)setHasStartMainBackGroundView:(BOOL)hasStartMainBackGroundView
{
    [UserStandardDefaults setBool:hasStartMainBackGroundView forKey:HasStartMainBackGroundView];
    [UserStandardDefaults synchronize];
}

- (BOOL)hasNetWrokingRuning
{
    return [UserStandardDefaults boolForKey:HasNetWrokingRuning];
}

-(void)setHasNetWrokingRuning:(BOOL)hasNetWrokingRuning
{
    [UserStandardDefaults setBool:hasNetWrokingRuning forKey:HasNetWrokingRuning];
    [UserStandardDefaults synchronize];
}

#pragma -mark- contacts people
- (void)setContactsName:(NSString *)contactsName
{
    [UserStandardDefaults setValue:contactsName forKey:ContactsName];
}
- (NSString *)contactsName
{
    return [NSString verifyString: [UserStandardDefaults stringForKey:ContactsName]];
}
- (void)setContactsPhone:(NSString *)contactsPhone
{
    [UserStandardDefaults setValue:contactsPhone forKey:ContactsPhone];
}
- (NSString *)contactsPhone
{
    return [NSString verifyString: [UserStandardDefaults stringForKey:ContactsPhone]];
}

#pragma mark - deviceToken
- (void)setDeviceToken:(NSString *)deviceToken
{
    [UserStandardDefaults setValue:deviceToken forKey:deviceTokenInfo];
    [UserStandardDefaults synchronize];
}
- (NSString *)deviceToken
{
    NSString *deviceToken = nil;
#ifdef DEBUG
#else
    deviceToken = [NSString verifyString: [UserStandardDefaults stringForKey:deviceTokenInfo]];
#endif
    return deviceToken?deviceToken:@"no deviceToken";
}

#pragma mark - orderStatus

- (void)setHasTicketOrderStatus:(NSString *)hasTicketOrderStatus
{
    [UserStandardDefaults setObject:hasTicketOrderStatus forKey:HasTicketOrderStatus];
    [UserStandardDefaults synchronize];
}

- (NSString *)hasTicketOrderStatus
{
    return [UserStandardDefaults stringForKey:HasTicketOrderStatus]?[UserStandardDefaults stringForKey:HasTicketOrderStatus]:@"";
}

- (void)setHasTicketOrderSuccessCounts:(NSNumber *)hasTicketOrderSuccessCounts
{
    [UserStandardDefaults setObject:hasTicketOrderSuccessCounts forKey:HasTicketOrderSuccessCounts];
    [UserStandardDefaults synchronize];
}

- (NSNumber *)hasTicketOrderSuccessCounts
{
    return [UserStandardDefaults objectForKey:HasTicketOrderSuccessCounts];
}

- (void)setHasTicketOrderFailureCounts:(NSNumber *)hasTicketOrderFailureCounts
{
    [UserStandardDefaults setObject:hasTicketOrderFailureCounts forKey:HasTicketOrderFailureCounts];
    [UserStandardDefaults synchronize];
}

- (NSNumber *)hasTicketOrderFailureCounts
{
    return [UserStandardDefaults objectForKey:HasTicketOrderFailureCounts];
}
@end

