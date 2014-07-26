//
//  MTiToast.h
//  MeetYou
//
//  Created by Curry on 14-7-13.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum iToastGravity {
	iToastGravityTop = 1000001,
	iToastGravityBottom,
	iToastGravityCenter
}iToastGravity;

enum iToastDuration {
	iToastDurationLong = 10000,
	iToastDurationShort = 1500,
	iToastDurationNormal = 3000
}iToastDuration;

typedef enum iToastType {
	iToastTypeInfo = -100000,
	iToastTypeNotice,
	iToastTypeWarning,
	iToastTypeError,
	iToastTypeNone // For internal use only (to force no image)
}iToastType;


@class iToastSettings;

@interface MTiToast : NSObject {
	iToastSettings *_settings;
	NSInteger offsetLeft;
	NSInteger offsetTop;
	
	NSTimer *timer;
	
	UIView *view;
	NSString *text;
}

- (void) show;
- (void) show:(iToastType) type;
- (MTiToast *) setDuration:(NSInteger ) duration;
- (MTiToast *) setGravity:(iToastGravity) gravity
                offsetLeft:(NSInteger) left
                 offsetTop:(NSInteger) top;
- (MTiToast *) setGravity:(iToastGravity) gravity;
- (MTiToast *) setPostion:(CGPoint) position;

+ (MTiToast *) makeText:(NSString *) text;

-(iToastSettings *) theSettings;

@end



@interface iToastSettings : NSObject<NSCopying>{
	NSInteger duration;
	iToastGravity gravity;
	CGPoint postition;
	iToastType toastType;
	
	NSDictionary *images;
	
	BOOL positionIsSet;
}


@property(assign) NSInteger duration;
@property(assign) iToastGravity gravity;
@property(assign) CGPoint postition;
@property(readonly) NSDictionary *images;


- (void) setImage:(UIImage *)img forType:(iToastType) type;
+ (iToastSettings *) getSharedSettings;

@end
