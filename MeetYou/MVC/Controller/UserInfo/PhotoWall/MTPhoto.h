//
//  MTPhoto.h
//  MeetYou
//
//  Created by Curry on 14-5-25.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTPhoto;

@protocol MTPhotoDelegate <NSObject>

@optional
- (void)photoTaped:(MTPhoto*)photo;
- (void)photoMoveFinished:(MTPhoto*)photo;

@end

typedef NS_ENUM(NSInteger, PhotoType) {
    PhotoTypePhoto  = 0, //Default
    PhotoTypeAdd = 1,
};

@interface MTPhoto : UIView

@property (assign) id<MTPhotoDelegate> delegate;

- (id)initWithOrigin:(CGPoint)origin;

- (void)setPhotoType:(PhotoType)type;
- (PhotoType)getPhotoType;
- (void)setPhotoUrl:(NSString*)photoUrl;
- (void)moveToPosition:(CGPoint)point;
- (void)setEditModel:(BOOL)edit;

@end
