//
//  StringArrayDictionaryCategories.h
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *
 */
#define FeedbackMaxWordCount 300
/*
 *
 */

#pragma mark - NSString (Verify)
@interface NSString (Verify)

+ (NSString *)verifyString:(id)input;
+ (NSString *)verifyNilString:(id)input;
+ (NSString *)verifyEmptyString:(id)input;
+ (BOOL)verifyEmptyForString:(id)input;
+ (BOOL)verifyPhone:(NSString *)input;
+ (BOOL)verifyEmail:(NSString *)input;
+ (BOOL)verifyIDCard:(NSString *)input;
+ (BOOL)verifyPassword:(NSString *)input;
+ (BOOL)verifyVerification:(NSString *)input;
+ (BOOL)verifyEnglishName:(NSString *)input;
+ (BOOL)verifyName:(NSString *)input;

+ (BOOL)verifyVerPhone:(NSString *)phone;
+ (BOOL)verifyPhone:(NSString *)phone password:(NSString *)password;
+ (BOOL)verifyPhone:(NSString *)phone verification:(NSString *)verification password:(NSString *)password;
+ (BOOL)verifyName:(NSString *)name gender:(NSString *)gender email:(NSString *)email address:(NSString *)address;
+ (BOOL)verifyOldPassword:(NSString *)oldPassword verification:(NSString *)verification newPassword:(NSString *)newPassword;
+ (BOOL)verifyFeedback:(NSString *)input;
+ (BOOL)verifyFeedback:(NSString *)feedback phoneOrEmail:(NSString *)phoneOrEmail;

@end


#pragma mark - NSMutableString (Verify)
@interface NSMutableString (Verify)

+ (NSMutableString *)verifyMutableString:(id)input;
+ (BOOL)verifyMPhone:(NSMutableString *)input;
+ (BOOL)verifyMEmail:(NSMutableString *)input;
+ (BOOL)verifyMIDCard:(NSMutableString *)input;
+ (BOOL)verifyMPassword:(NSMutableString *)input;
+ (BOOL)verifyMVerification:(NSMutableString *)input;

+ (BOOL)verifyMVerPhone:(NSMutableString *)phone;
+ (BOOL)verifyMPhone:(NSMutableString *)phone password:(NSMutableString *)password;
+ (BOOL)verifyMPhone:(NSMutableString *)phone verification:(NSMutableString *)verification password:(NSMutableString *)password;
+ (BOOL)verifyMName:(NSMutableString *)name gender:(NSMutableString *)gender email:(NSMutableString *)email address:(NSMutableString *)address;
+ (BOOL)verifyMOldPassword:(NSMutableString *)oldPassword verification:(NSMutableString *)verification newPassword:(NSMutableString *)newPassword;

+ (BOOL)verifyMFeedback:(NSMutableString *)input;
+ (BOOL)verifyMFeedback:(NSMutableString *)feedback phoneOrEmail:(NSMutableString *)phoneOrEmail;

@end


#pragma mark - NSArray (Verify)
@interface NSArray (Verify)

+ (NSArray *)verifyArray:(id)input;
+ (NSArray *)verifyUserIdCheck:(NSString *)input;
@end


#pragma mark - NSMutableArray (Verify)
@interface NSMutableArray (Verify)

+ (NSMutableArray *)verifyMutableArray:(id)input;

@end


#pragma mark - NSDictionary (Verify)
@interface NSDictionary (Verify)

+ (NSDictionary *)verifyDictionary:(id)input;

@end

#pragma mark - NSMutableDictionary (Verify)
@interface NSMutableDictionary (Verify)

+ (NSMutableDictionary *)verifyMutableDictionary:(id)input;

@end
