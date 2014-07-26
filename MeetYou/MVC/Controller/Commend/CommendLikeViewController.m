//
//  CommendLikeViewController.m
//  MeetYou
//
//  Created by Curry on 14-7-5.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendLikeViewController.h"

@interface CommendLikeViewController ()

@property (weak, nonatomic)IBOutlet UIButton *sendMessageButton;
@property (weak, nonatomic)IBOutlet UIButton *laterButton;
@property (weak, nonatomic)IBOutlet UILabel *infoLabel;
@property (weak, nonatomic)IBOutlet UILabel *myNameLabel;
@property (weak, nonatomic)IBOutlet UILabel *otherNameLabel;
@property (weak, nonatomic)IBOutlet UIImageView *myHeaderImage;
@property (weak, nonatomic)IBOutlet UIImageView *otherHeaderImage;
@end

@implementation CommendLikeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//返回
- (IBAction)backViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_myHeaderImage.layer setCornerRadius:(_myHeaderImage.frame.size.height/2)];
    [_myHeaderImage setImage:[UIImage imageNamed:@"bacgImage"]];
    [_myHeaderImage.layer setMasksToBounds:YES];
    [_myHeaderImage setContentMode:UIViewContentModeScaleAspectFill];
    [_myHeaderImage setClipsToBounds:YES];
    _myHeaderImage.layer.shadowOpacity = 0.5;
    _myHeaderImage.layer.shadowRadius = 2.0;
    _myHeaderImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *myHeaderImageportraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myHeadereditPortrait)];
    [_myHeaderImage addGestureRecognizer:myHeaderImageportraitTap];
    
    [_otherHeaderImage.layer setCornerRadius:(_otherHeaderImage.frame.size.height/2)];
    [_otherHeaderImage setImage:[UIImage imageNamed:@"bacgImage"]];
    [_otherHeaderImage.layer setMasksToBounds:YES];
    [_otherHeaderImage setContentMode:UIViewContentModeScaleAspectFill];
    [_otherHeaderImage setClipsToBounds:YES];
    _otherHeaderImage.layer.shadowOpacity = 0.5;
    _otherHeaderImage.layer.shadowRadius = 2.0;
    _otherHeaderImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *otherHeaderImageportraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(otherHeadereditPortrait)];
    [_otherHeaderImage addGestureRecognizer:otherHeaderImageportraitTap];
}

- (void)myHeadereditPortrait
{
    [[[MTiToast makeText:@"你点击了自己的头像"] setGravity:iToastGravityCenter] show];
}

- (void)otherHeadereditPortrait
{
    [[[MTiToast makeText:@"你点击了她的头像"] setGravity:iToastGravityCenter] show];
}


- (IBAction)sendMessage:(id)sender {
    [[[MTiToast makeText:@"发消息"] setGravity:iToastGravityCenter] show];
}

- (IBAction)laterDoSomeThing:(id)sender {
    [[[MTiToast makeText:@"以后在说"] setGravity:iToastGravityCenter] show];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
