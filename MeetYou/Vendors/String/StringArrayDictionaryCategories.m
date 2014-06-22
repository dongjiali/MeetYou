//
//  StringArrayDictionaryCategories.m
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "StringArrayDictionaryCategories.h"
/*
 *
 */
#define AlertTitle @"提示"
#define AlertCancelButtonTitle @"确定"
#define PhoneEmptyMessage @"账号不能为空"
#define PhoneErrorMessage @"手机号格式错误"
#define VerificationEmptyMessage @"验证码不能为空"
#define VerificationErrorMessage @"验证码格式错误"
#define EmailEmptyMessage @"邮箱不能为空"
#define EmailErrorMessage @"邮箱格式错误"
#define PasswordEmptyMessage @"密码不能为空"
#define PasswordErrorMessage @"密码格式错误"
#define IDCardEmptyMessage @"身份证不能为空"
#define IDCardErrorMessage @"身份证格式错误"
#define NameEmptyMessage @"姓名不能为空"
#define GenderEmptyMessage @"性别不能为空"
#define AddressEmptyMessage @"地址不能为空"
#define ContactInfoEmptyMessage @"联系方式不能为空"
#define ContactInfoErrorMessage @"联系方式格式错误"
#define FeedbackEmptyMessage @"反馈内容不能为空"
#define FeedbackErrorMessage @"反馈内容超出字数限制"
/*
 *
 */
NSPredicate *phonePredicate;
NSPredicate *emailPredicate;
NSPredicate *idPredicate;
NSPredicate *passwordPredicate;
NSPredicate *verificationPredicate;

#pragma mark - NSString (Verify)
@implementation NSString (Verify)
// 校验字符串对象是否为nil
+ (NSString *)verifyString:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (!input)
    //    {// 如果为nil，赋值@""
    //        input = @"";
    //    }
    return input;
}

+ (NSString *)verifyNilString:(id)input {
    if ([input isKindOfClass:[NSNull class]]) {
        input = nil;
    }
    if (input == nil) {// 如果为nil，赋值@""
        input = @"";
    }
    return input;
}
/**
 *  检查该字符串是否为空字符串，并返回@""
 *
 *  @param input ->待检查字符串
 *
 *  @return 返回 input
 */
+ (NSString *)verifyEmptyString:(id)input {
    if ([input isKindOfClass:[NSNull class]]) {
        input = @"";
    }
    if ([input isEqual:nil]) {
        input = @"";
    }
    return input;
}

+ (BOOL)verifyEmptyForString:(id)input {
    BOOL result = NO;
    if ([input isKindOfClass:[NSNull class]]) {
        result = YES;
    }
    if ([input isEqual:nil]) {
        result = YES;
    }
    if (0 == [input length]) {
        result = YES;
    }
    
    return result;
}

//校验英文姓名
+ (BOOL)verifyEnglishName:(NSString *)input
{
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *englisthNamePredicate =  [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return  [englisthNamePredicate evaluateWithObject:input];
}

//校验姓名不能包含非法字符
+ (BOOL)verifyName:(NSString *)input
{
    NSString *regex = @"^[\u4e00-\u9fa5a-zA-Z0-9_/]{2,20}$";
    NSPredicate *englisthNamePredicate =  [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return  [englisthNamePredicate evaluateWithObject:input];
}

// 校验手机号
+ (BOOL)verifyPhone:(NSString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(170)|(18[0,2,4-9]))\\d{8}$";
        phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [phonePredicate evaluateWithObject:input];
}

// 校验邮箱
+ (BOOL)verifyEmail:(NSString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
        emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [emailPredicate evaluateWithObject:input];
}

// 校验身份证号
+ (BOOL)verifyIDCard:(NSString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // NSString *regex = @"[1-9]\\d{13,16}[a-zA-Z0-9]{1}";
        NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
        idPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [idPredicate evaluateWithObject:input];
}

// 校验密码
+(BOOL)verifyPassword:(NSString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^[a-zA-Z]\\w{5,19}$";// 字母开头，6-20位的字母、数字混排
        regex = @"^[a-zA-Z0-9]\\w{5,19}$";// 6-20位的字母、数字混排
        passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [passwordPredicate evaluateWithObject:input];
}

// 校验验证码
+ (BOOL)verifyVerification:(NSString *)input
{
    return YES;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^\\d{10}$";
        verificationPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [verificationPredicate evaluateWithObject:input];
}

// 校验反馈内容
+ (BOOL)verifyFeedback:(NSString *)input
{
    return (input.length <= FeedbackMaxWordCount);
}



#pragma mark -
// 校验获取验证码的手机号
+ (BOOL)verifyVerPhone:(NSString *)phone
{
    if ([NSString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSString verifyPhone:phone]) {// 手机号符合规则
                return YES;
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 校验手机号和密码
+ (BOOL)verifyPhone:(NSString *)phone password:(NSString *)password
{
    if ([NSString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSString verifyPhone:phone]) {// 手机号符合规则
                if ([NSString verifyString:password]) {
                    if (password.length) {// 密码不为空
                        if ([NSString verifyPassword:password]) {// 密码符合规则
                            return YES;
                        }else {// 密码不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 密码为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 校验手机号、验证码和密码
+ (BOOL)verifyPhone:(NSString *)phone verification:(NSString *)verification password:(NSString *)password
{
    if ([NSString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSString verifyPhone:phone]) {// 手机号符合规则
                if ([NSString verifyString:verification]) {
                    if (verification.length) {// 验证码不为空
                        if ([NSString verifyVerification:verification]) {// 验证码符合规则
                            if ([NSString verifyString:password]) {
                                if (password.length) {// 密码不为空
                                    if ([NSString verifyPassword:password]) {// 密码符合规则
                                        return YES;
                                    }else {// 密码不符合规则
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }else {// 密码为空
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                }
                            }
                        }else {// 验证码不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 验证码为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 验证用户姓名、性别、邮箱、地址
+ (BOOL)verifyName:(NSString *)name gender:(NSString *)gender email:(NSString *)email address:(NSString *)address
{
    if ([NSString verifyString:name]) {
        if (name.length) {// 姓名不为空
            if ([NSString verifyString:gender]) {
                if (gender.length) {// 性别不为空
                    if ([NSString verifyString:email]) {
                        if (email.length) {// 邮箱不为空
                            if ([NSString verifyEmail:email]) {// 邮箱符合规则
                                if ([NSString verifyString:address]) {
                                    if (address.length) {// 地址不为空
                                        return YES;
                                    }else {// 地址为空
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }
                            }else {// 邮箱不符合规则
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                            }
                        }else {// 邮箱为空
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }
                }else {// 性别为空
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:GenderEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                }
            }
        }else {// 姓名为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NameEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}

// 验证旧密码、验证码、新密码
+ (BOOL)verifyOldPassword:(NSString *)oldPassword verification:(NSString *)verification newPassword:(NSString *)newPassword
{
    if ([NSString verifyString:oldPassword]) {
        if (oldPassword.length) {// 旧密码不为空
            if ([NSString verifyPassword:oldPassword]) {// 旧密码符合规则
                if ([oldPassword isEqualToString:UserInfoManager.password]) {// 旧密码正确
                    if ([NSString verifyString:verification]) {
                        if (verification.length) {// 验证码不为空
                            if ([NSString verifyVerification:verification]) {// 验证码符合规则
                                if ([NSString verifyString:newPassword]) {
                                    if (newPassword.length) {// 新密码不为空
                                        if ([NSString verifyPassword:newPassword]) {// 新密码符合规则
                                            return YES;
                                        }else {// 新密码不符合规则
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"新密码格式错误" delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                        }
                                    }else {// 新密码为空
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"新密码不能为空" delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }
                            }else {// 验证码不符合规则
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                            }
                        }else {// 验证码为空
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }
                }else {// 旧密码正确
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"原密码错误" delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                }
            }else {// 旧密码不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"原密码格式错误" delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 旧密码为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"原密码不能为空" delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}

// 验证反馈内容、手机号或者邮箱
+ (BOOL)verifyFeedback:(NSString *)feedback phoneOrEmail:(NSString *)phoneOrEmail
{
    if ([NSString verifyString:feedback]) {
        if (feedback.length) {// 反馈内容不为空
            if ([NSString verifyFeedback:feedback]) {// 反馈内容符合规则
                if ([NSString verifyString:phoneOrEmail]) {
                    if (phoneOrEmail.length) {// 联系方式不为空
                        if ([NSString verifyPhone:phoneOrEmail] || [NSString verifyEmail:phoneOrEmail]) {// 联系方式符合规则
                            return YES;
                        }else {// 联系方式不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:ContactInfoErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 联系方式为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:ContactInfoEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 反馈内容不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:FeedbackErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 反馈内容为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:FeedbackEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}
#pragma mark -

@end








#pragma mark - NSMutableString (Verify)
@implementation NSMutableString (Verify)
// 校验获取验证码的手机号
+ (BOOL)verifyMVerPhone:(NSMutableString *)phone
{
    if ([NSMutableString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSMutableString verifyPhone:phone]) {// 手机号符合规则
                return YES;
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 校验可变字符串对象是否为nil
+ (NSMutableString *)verifyMutableString:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (input == nil)
    //    {// 如果为nil，赋值@""
    //        input = [NSMutableString stringWithString:@""];
    //    }
    return input;
}

// 校验手机号
+ (BOOL)verifyMPhone:(NSMutableString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
        phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [phonePredicate evaluateWithObject:input];
}

// 校验邮箱
+ (BOOL)verifyMEmail:(NSMutableString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [emailPredicate evaluateWithObject:input];
}

// 校验身份证号
+ (BOOL)verifyMIDCard:(NSMutableString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"/^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$/";
        idPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [idPredicate evaluateWithObject:input];
}

// 校验密码
+(BOOL)verifyMPassword:(NSMutableString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^[a-zA-Z]\\w{5,19}$";
        passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [passwordPredicate evaluateWithObject:input];
    
    if (input.length <6 || input.length >20)
        return NO;
    return YES;
}

// 校验验证码
+ (BOOL)verifyMVerification:(NSMutableString *)input
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *regex = @"^\\d{6}$";
        verificationPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    });
    return [verificationPredicate evaluateWithObject:input];
}

// 校验反馈内容
+ (BOOL)verifyMFeedback:(NSMutableString *)input
{
    return (input.length <= FeedbackMaxWordCount);
}

#pragma mark -
// 校验手机号和密码
+ (BOOL)verifyMPhone:(NSMutableString *)phone password:(NSMutableString *)password
{
    if ([NSMutableString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSMutableString verifyPhone:phone]) {// 手机号符合规则
                if ([NSMutableString verifyString:password]) {
                    if (password.length) {// 密码不为空
                        if ([NSMutableString verifyPassword:password]) {// 密码符合规则
                            return YES;
                        }else {// 密码不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 密码为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 校验手机号、验证码和密码
+ (BOOL)verifyMPhone:(NSMutableString *)phone verification:(NSMutableString *)verification password:(NSMutableString *)password
{
    if ([NSMutableString verifyString:phone]) {
        if (phone.length) {// 手机号不为空
            if ([NSMutableString verifyPhone:phone]) {// 手机号符合规则
                if ([NSMutableString verifyString:verification]) {
                    if (verification.length) {// 验证码不为空
                        if ([NSMutableString verifyVerification:verification]) {// 验证码符合规则
                            if ([NSMutableString verifyString:password]) {
                                if (password.length) {// 密码不为空
                                    if ([NSMutableString verifyPassword:password]) {// 密码符合规则
                                        return YES;
                                    }else {// 密码不符合规则
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }else {// 密码为空
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                }
                            }
                        }else {// 验证码不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 验证码为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 手机号不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 手机号为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PhoneEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


+ (BOOL)verifyMName:(NSMutableString *)name gender:(NSMutableString *)gender email:(NSMutableString *)email address:(NSMutableString *)address
{
    if ([NSMutableString verifyString:name]) {
        if (name.length) {// 姓名不为空
            if ([NSMutableString verifyString:gender]) {
                if (gender.length) {// 性别不为空
                    if ([NSMutableString verifyString:email]) {
                        if (email.length) {// 邮箱不为空
                            if ([NSMutableString verifyEmail:email]) {// 邮箱符合规则
                                if ([NSMutableString verifyString:address]) {
                                    if (address.length) {// 地址不为空
                                        return YES;
                                    }else {// 地址为空
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }
                            }else {// 邮箱不符合规则
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                            }
                        }else {// 邮箱为空
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:EmailEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }
                }else {// 性别为空
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:GenderEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                }
            }
        }else {// 姓名为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NameEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}


// 验证旧密码、验证码、新密码
+ (BOOL)verifyMOldPassword:(NSMutableString *)oldPassword verification:(NSMutableString *)verification newPassword:(NSMutableString *)newPassword
{
    if ([NSMutableString verifyString:oldPassword]) {
        if (oldPassword.length) {// 旧密码不为空
            if ([NSMutableString verifyPassword:oldPassword]) {// 旧密码符合规则
                if ([NSMutableString verifyString:verification]) {
                    if (verification.length) {// 验证码不为空
                        if ([NSMutableString verifyVerification:verification]) {// 验证码符合规则
                            if ([NSMutableString verifyString:newPassword]) {
                                if (newPassword.length) {// 新密码不为空
                                    if ([NSMutableString verifyPassword:newPassword]) {// 新密码符合规则
                                        return YES;
                                    }else {
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                    }
                                }else {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                                }
                            }
                            
                        }else {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:VerificationEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:PasswordEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}

// 验证反馈内容、手机号或者邮箱
+ (BOOL)verifyMFeedback:(NSString *)feedback phoneOrEmail:(NSString *)phoneOrEmail
{
    if ([NSString verifyString:feedback]) {
        if (feedback.length) {// 反馈内容不为空
            if ([NSString verifyFeedback:feedback]) {// 反馈内容符合规则
                if ([NSString verifyString:phoneOrEmail]) {
                    if (phoneOrEmail.length) {// 联系方式不为空
                        if ([NSString verifyPhone:phoneOrEmail] || [NSString verifyEmail:phoneOrEmail]) {// 联系方式符合规则
                            return YES;
                        }else {// 联系方式不符合规则
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:ContactInfoErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                        }
                    }else {// 联系方式为空
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:ContactInfoEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
                    }
                }
            }else {// 反馈内容不符合规则
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:FeedbackErrorMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
            }
        }else {// 反馈内容为空
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:FeedbackEmptyMessage delegate:self cancelButtonTitle:AlertCancelButtonTitle otherButtonTitles:nil, nil]; [alert show];
        }
    }
    return NO;
}
#pragma mark -

@end












#pragma mark - NSArray (Verify)
@implementation NSArray (Verify)
// 校验数组对象是否为nil
+ (NSArray *)verifyArray:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (input == nil)
    //    {// 如果为nil，赋值@[]
    //        input = @[];
    //    }
    return input;
}

+ (NSArray *)verifyUserIdCheck:(NSString *)input
{
    //获取身份证长度
    NSString *credentialNum = input;
    NSUInteger length = credentialNum.length;
    NSMutableArray *flagArray = [[NSMutableArray alloc]initWithCapacity:1];
    
    //不是18位
    if (length != 18)
    {
        return nil;
    }
    
    NSArray *area = [[NSArray alloc] initWithObjects:@"11",@"12",@"13",@"14",@"15",@"21",@"22",@"23",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"41",@"42",@"43",@"44",@"45",@"45",@"50",@"51",@"52",@"53",@"54",@"61",@"62",@"63",@"64",@"65",@"71",@"81",@"82",@"91",nil];
    
    //    {11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
    //    NSString *idcard;
    //    NSString *JYM;
    //       int S,M,Y;
    //    var idcard_array = new Array();
    
    //地区检验
    BOOL tag = NO;
    for (int i =0; i< [area count]; i++) {
        if ([[area objectAtIndex:i] isEqualToString:[credentialNum substringToIndex:2]]) {
            tag = YES;
            break;
        }
        else {
            tag = NO;
        }
    }
    if(!tag)
    {
        return nil;
    }
    
    //判断传过来的身份证号是否为18位
    if (length == 18)
    {
        /********************较验证件号前17位是否是数字和末们较验位*****************/
        long sum = 0;
        for (int i = length; i > 1; i--)
        {
            int a = [credentialNum characterAtIndex:length-i]-'0';
            long w = 1;
            
            for (int j = i; j > 1; j--)
            {
                w = w * 2;
            }
            sum = sum + a * w%11;
        }
        //获取输入证件号的末位较验码
        char codeX = [credentialNum characterAtIndex:17];
        //根据输入的17位公式得出的末位较验位
        char X = [@"10X98765432" characterAtIndex:sum%11];
        if (codeX != X)
        {
            return nil;
        }
        NSString *strYear = [credentialNum substringWithRange:NSMakeRange(6, 4)];
        NSString *strMonth = [credentialNum substringWithRange:NSMakeRange(10, 2)];
        NSString *strDay = [credentialNum substringWithRange:NSMakeRange(12, 2)];
        NSString *strbrithday = [NSString stringWithFormat:@"%@-%@-%@",strYear,strMonth,strDay];
        //取得第18们性别位 进行性别较验
        NSString *sexString = @"";
        int sex18 = [credentialNum characterAtIndex:length-2]-'0';
        if (sex18%2 == 1) {
            sexString = [NSString stringWithFormat:@"男"];
        }
        else if(sex18%2 ==0)
        {
            sexString = [NSString stringWithFormat:@"女"];
        }
        [flagArray addObject:sexString];
        [flagArray addObject:strbrithday];
    }
    return flagArray;
}

@end


#pragma mark - NSMutableArray (Verify)
@implementation NSMutableArray (Verify)
// 校验可变数组对象是否为nil
+ (NSMutableArray *)verifyMutableArray:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (input == nil)
    //    {// 如果为nil，赋值@[]
    //        input = [NSMutableArray arrayWithArray:@[]];
    //    }
    return input;
}

@end


#pragma mark - NSDictionary (Verify)
@implementation NSDictionary (Verify)
// 校验字典对象是否为nil
+ (NSDictionary *)verifyDictionary:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (input == nil)
    //    {// 如果为nil，赋值@{}
    //        input = @{};
    //    }
    return input;
}

@end


#pragma mark - NSMutableDictionary (Verify)
@implementation NSMutableDictionary (Verify)
// 校验可变典对象是否为nil
+ (NSMutableDictionary *)verifyMutableDictionary:(id)input
{
    if ([input isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    //    else if (input == nil)
    //    {// 如果为nil，赋值@{}
    //        input = [NSMutableDictionary dictionaryWithDictionary:@{}];
    //    }
    return input;
}

@end
