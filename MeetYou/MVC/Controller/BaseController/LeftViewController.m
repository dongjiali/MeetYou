//
//  LeftViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "LeftViewController.h"
#import "SliderViewController.h"
#import "VPViewController.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#define ORIGINAL_MAX_WIDTH 640.0f

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) UIImageView *portraitImageView;
@property (nonatomic, strong) UIView *userInfoHeaderView;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UILabel *userNameLabel;

@property (nonatomic, strong)NSArray *leftTableTitle;
@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = ColorRGBA(39, 39, 39);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    NSString *userName = _userInfo;
    self.leftTableTitle = @[@"推荐",@"活动",@"消息",@"设置",];
	// Do any additional setup after loading the view.
    
    self.userInfoHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 220)];
    _userInfoHeaderView.backgroundColor = ColorRGBA(39, 39, 39);
    [_userInfoHeaderView addSubview:[self portraitImageView:_userInfoHeaderView]];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _userInfoHeaderView.frame.size.height-1, _userInfoHeaderView.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor grayColor];
    [_userInfoHeaderView addSubview:lineView];
    
    self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_portraitImageView.center.x - 20, _portraitImageView.frame.size.height + 60, 200, 30)];
    _userNameLabel.text = @"橘子";
    _userNameLabel.textColor = [UIColor whiteColor];
    [_userInfoHeaderView addSubview:_userNameLabel];
    self.tableView.tableHeaderView = _userInfoHeaderView;
    [self loadPortrait];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor  =[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.textLabel setText:_leftTableTitle[indexPath.row]];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _leftTableTitle.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
//        case 0:
//            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MainViewController"];
//            break;
        case 0:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"CommendNavigationController"];
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"ActivitiesNavigationController"];
            break;
        case 2:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MessageNavigationController"];
            break;
        case 3:
            //user root view
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"SettingNavigationController"];
            break;
        default:
            break;
    }
}

- (void)loadPortrait {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^ {
        NSURL *portraitUrl = [NSURL URLWithString:@"http://photo.l99.com/bigger/31/1363231021567_5zu910.jpg"];
        UIImage *protraitImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:portraitUrl]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.portraitImageView.image = protraitImg;
        });
    });
}

- (void)editPortrait {
    //选照片 禁止
//    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
//                                                             delegate:self
//                                                    cancelButtonTitle:@"取消"
//                                               destructiveButtonTitle:nil
//                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
//    [choiceSheet showInView:self.view];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"UserInfoNavigationController"];
}

#pragma mark portraitImageView getter
- (UIImageView *)portraitImageView:(UIView *)view {
    if (!_portraitImageView) {
        CGFloat w = 100.0f; CGFloat h = w;
        CGFloat x = (view.frame.size.width - w) / 2 - 30;
        CGFloat y = (view.frame.size.height - h) / 2 - 20;
        _portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_portraitImageView.layer setCornerRadius:(_portraitImageView.frame.size.height/2)];
        [_portraitImageView.layer setMasksToBounds:YES];
        [_portraitImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_portraitImageView setClipsToBounds:YES];
        _portraitImageView.layer.shadowColor = [UIColor blackColor].CGColor;
        _portraitImageView.layer.shadowOffset = CGSizeMake(4, 4);
        _portraitImageView.layer.shadowOpacity = 0.5;
        _portraitImageView.layer.shadowRadius = 2.0;
        _portraitImageView.userInteractionEnabled = YES;
        _portraitImageView.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortrait)];
        [_portraitImageView addGestureRecognizer:portraitTap];
    }
    return _portraitImageView;
}

@end