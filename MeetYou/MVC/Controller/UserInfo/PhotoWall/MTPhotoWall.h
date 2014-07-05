//
//  MTPhotoWall.h
//  MeetYou
//
//  Created by Curry on 14-5-25.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MTPhotoWallDelegate <NSObject>

- (void)photoWallPhotoTaped:(NSUInteger)index;
- (void)photoWallMovePhotoFromIndex:(NSInteger)index toIndex:(NSInteger)newIndex;
- (void)photoWallAddAction;
- (void)photoWallAddFinish;
- (void)photoWallDeleteFinish;

@end

@interface MTPhotoWall : UIView

@property (assign) id<MTPhotoWallDelegate> delegate;

- (void)setPhotos:(NSArray*)photos;
- (void)setEditModel:(BOOL)canEdit;
- (void)addPhoto:(UIImage*)string;
- (void)deletePhotoByIndex:(NSUInteger)index;
@end