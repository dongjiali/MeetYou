//
//  SliderViewController.h
//  MeetYou
//
//  Created by Curry on 14-5-20.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController
@property (nonatomic, copy) NSString *mainVCClassName;

@property(nonatomic,strong)UIViewController *LeftVC;
@property(nonatomic,strong)UIViewController *RightVC;
@property(nonatomic,strong)UIViewController *MainVC;

@property(nonatomic,assign)float LeftSContentOffset;
@property(nonatomic,assign)float RightSContentOffset;

@property(nonatomic,assign)float LeftSContentScale;
@property(nonatomic,assign)float RightSContentScale;

@property(nonatomic,assign)float LeftSJudgeOffset;
@property(nonatomic,assign)float RightSJudgeOffset;

@property(nonatomic,assign)float LeftSOpenDuration;
@property(nonatomic,assign)float RightSOpenDuration;

@property(nonatomic,assign)float LeftSCloseDuration;
@property(nonatomic,assign)float RightSCloseDuration;

@property (nonatomic, assign) BOOL canMoveWithGesture;

@property (nonatomic, assign) BOOL isLeftViewShow;
@property (nonatomic, assign) BOOL isRightViewShow;

+ (SliderViewController*)sharedSliderController;

- (void)showContentControllerWithModel:(NSString*)className;
- (void)leftItemClick;
- (void)rightItemClick;
- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes;

@end

