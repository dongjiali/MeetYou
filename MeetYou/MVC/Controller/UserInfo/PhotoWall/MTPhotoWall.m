//
//  MTPhotoWall.m
//  MeetYou
//
//  Created by Curry on 14-5-25.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "MTPhotoWall.h"

#import "MTPhoto.h"

@interface MTPhotoWall()<MTPhotoDelegate>
@property (strong, nonatomic) UILabel *labelDescription;

@property (strong, nonatomic) NSArray *arrayPositions;
@property (strong, nonatomic) NSMutableArray *arrayPhotos;
@property (nonatomic) BOOL isEditModel;

@end

#define kFrameHeight 95.
#define kFrameHeight2x 175.

#define kImagePositionx @"positionx"
#define kImagePositiony @"positiony"

@implementation MTPhotoWall

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0., 0., 320., 0.)];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        
        self.arrayPositions = [NSArray arrayWithObjects:
                               [NSDictionary dictionaryWithObjectsAndKeys:@"4", kImagePositionx, @"10", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"83", kImagePositionx, @"10", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"162", kImagePositionx, @"10", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"241", kImagePositionx, @"10", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"4", kImagePositionx, @"90", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"83", kImagePositionx, @"90", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"162", kImagePositionx, @"90", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"241", kImagePositionx, @"90", kImagePositiony, nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:@"330", kImagePositionx, @"90", kImagePositiony, nil], nil];
        self.arrayPhotos = [NSMutableArray arrayWithCapacity:1];
        
        self.labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(10., 0., 300., 18.)];
        self.labelDescription.backgroundColor = [UIColor clearColor];
        self.labelDescription.textColor = [UIColor whiteColor];
        self.labelDescription.font = [UIFont systemFontOfSize:12.];
        self.labelDescription.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:self.labelDescription];
        
        self.labelDescription.hidden = YES;
        self.labelDescription.text = @"拖拽图片可以排列顺序, 点击添加照片.";
    }
    return self;
}

- (void)setPhotos:(NSArray*)photos
{
    [self.arrayPhotos removeAllObjects];
    NSUInteger count = [photos count];
    for (int i=0; i<count; i++) {
        NSDictionary *dictionaryTemp = [self.arrayPositions objectAtIndex:i];
        CGFloat originx = [[dictionaryTemp objectForKey:kImagePositionx] floatValue];
        CGFloat originy = [[dictionaryTemp objectForKey:kImagePositiony] floatValue];
        MTPhoto *photoTemp = [[MTPhoto alloc] initWithOrigin:CGPointMake(originx, originy)];
        photoTemp.delegate = self;
        [photoTemp setPhotoUrl:[photos objectAtIndex:i]];
        [self addSubview:photoTemp];
        [self.arrayPhotos addObject:photoTemp];
    }
    
    NSDictionary *dictionaryTemp = [self.arrayPositions objectAtIndex:count];
    CGFloat originx = [[dictionaryTemp objectForKey:kImagePositionx] floatValue];
    CGFloat originy = [[dictionaryTemp objectForKey:kImagePositiony] floatValue];
    MTPhoto *photoTemp = [[MTPhoto alloc] initWithOrigin:CGPointMake(originx, originy)];
    photoTemp.delegate = self;
    photoTemp.hidden = YES;
    [photoTemp setPhotoType:PhotoTypeAdd];
    [self.arrayPhotos addObject:photoTemp];
    [self addSubview:photoTemp];
    
    CGFloat frameHeight = -1;
    if (count > 4) {
        frameHeight = kFrameHeight2x;
    } else {
        frameHeight = kFrameHeight;
    }
    self.frame = CGRectMake(0., 0., 320., frameHeight);
}

- (void)setEditModel:(BOOL)canEdit
{
    self.isEditModel = canEdit;
    if (self.isEditModel) {
        MTPhoto *viewTemp = [self.arrayPhotos lastObject];
        viewTemp.hidden = NO;
        self.labelDescription.hidden = NO;
    } else {
        MTPhoto *viewTemp = [self.arrayPhotos lastObject];
        viewTemp.hidden = YES;
        self.labelDescription.hidden = YES;
    }
    
    NSUInteger count = [self.arrayPhotos count]-1;
    for (int i=0; i<count; i++) {
        MTPhoto *viewTemp = [self.arrayPhotos objectAtIndex:i];
        [viewTemp setEditModel:self.isEditModel];
    }
    [self reloadPhotos:NO];
}

- (void)addPhoto:(NSString*)string
{
    NSUInteger index = [self.arrayPhotos count] - 1;
    NSDictionary *dictionaryTemp = [self.arrayPositions objectAtIndex:index];
    CGFloat originx = [[dictionaryTemp objectForKey:kImagePositionx] floatValue];
    CGFloat originy = [[dictionaryTemp objectForKey:kImagePositiony] floatValue];
    
    MTPhoto *photoTemp = [[MTPhoto alloc] initWithOrigin:CGPointMake(originx, originy)];
    photoTemp.delegate = self;
    [photoTemp setPhotoUrl:string];
    
    [self.arrayPhotos insertObject:photoTemp atIndex:index];
    [self addSubview:photoTemp];
    [self reloadPhotos:YES];
}

- (void)deletePhotoByIndex:(NSUInteger)index
{
    MTPhoto *photoTemp = [self.arrayPhotos objectAtIndex:index];
    [self.arrayPhotos removeObject:photoTemp];
    [photoTemp removeFromSuperview];
    [self reloadPhotos:YES];
}

#pragma mark - Photo

- (void)photoTaped:(MTPhoto*)photo
{
    NSUInteger type = [photo getPhotoType];
    if (type == PhotoTypeAdd) {
        if ([self.delegate respondsToSelector:@selector(photoWallAddAction)]) {
            [self.delegate photoWallAddAction];
        }
    } else if (type == PhotoTypePhoto) {
        NSUInteger index = [self.arrayPhotos indexOfObject:photo];
        if ([self.delegate respondsToSelector:@selector(photoWallPhotoTaped:)]) {
            [self.delegate photoWallPhotoTaped:index];
        }
    }
}

- (void)photoMoveFinished:(MTPhoto*)photo
{
    CGPoint pointPhoto = CGPointMake(photo.frame.origin.x, photo.frame.origin.y);
    CGFloat space = -1;
    NSUInteger oldIndex = [self.arrayPhotos indexOfObject:photo];
    NSUInteger newIndex = -1;
    
    NSUInteger count = [self.arrayPhotos count] - 1;
    for (int i=0; i<count; i++) {
        NSDictionary *dictionaryTemp = [self.arrayPositions objectAtIndex:i];
        CGFloat originx = [[dictionaryTemp objectForKey:kImagePositionx] floatValue];
        CGFloat originy = [[dictionaryTemp objectForKey:kImagePositiony] floatValue];
        CGPoint pointTemp = CGPointMake(originx, originy);
        CGFloat spaceTemp = [self spaceToPoint:pointPhoto FromPoint:pointTemp];
        if (space < 0) {
            space = spaceTemp;
            newIndex = i;
        } else {
            if (spaceTemp < space) {
                space = spaceTemp;
                newIndex = i;
            }
        }
    }
    
    [self.arrayPhotos removeObject:photo];
    [self.arrayPhotos insertObject:photo atIndex:newIndex];
    
    [self reloadPhotos:NO];
    
    if ([self.delegate respondsToSelector:@selector(photoWallMovePhotoFromIndex:toIndex:)]) {
        [self.delegate photoWallMovePhotoFromIndex:oldIndex toIndex:newIndex];
    }
}

- (void)reloadPhotos:(BOOL)add
{
    NSUInteger count = -1;
    if (add) {
        count = [self.arrayPhotos count];
    } else {
        count = [self.arrayPhotos count] - 1;
    }
    for (int i=0; i<count; i++) {
        NSDictionary *dictionaryTemp = [self.arrayPositions objectAtIndex:i];
        CGFloat originx = [[dictionaryTemp objectForKey:kImagePositionx] floatValue];
        CGFloat originy = [[dictionaryTemp objectForKey:kImagePositiony] floatValue];
        
        MTPhoto *photoTemp = [self.arrayPhotos objectAtIndex:i];
        [photoTemp moveToPosition:CGPointMake(originx, originy)];
    }
    
    CGFloat frameHeight = -1;
    NSUInteger countPhoto = [self.arrayPhotos count];
    if (self.isEditModel) {
        if (countPhoto > 4) {
            frameHeight = kFrameHeight2x + 20.;
        } else {
            frameHeight = kFrameHeight + 20.;
        }
        self.labelDescription.frame = CGRectMake(self.labelDescription.frame.origin.x, frameHeight - 20., self.labelDescription.frame.size.width, self.labelDescription.frame.size.height);
    } else {
        if (countPhoto > 5) {
            frameHeight = kFrameHeight2x;
        } else {
            frameHeight = kFrameHeight;
        }
    }
    self.frame = CGRectMake(0., 0., 320., frameHeight);
}

- (CGFloat)spaceToPoint:(CGPoint)point FromPoint:(CGPoint)otherPoint
{
    float x = point.x - otherPoint.x;
    float y = point.y - otherPoint.y;
    return sqrt(x * x + y * y);
}

@end

