//
//  CommendViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendViewController.h"
#import "CommendLikeViewController.h"


@interface CommendViewController ()
@property (nonatomic,weak)IBOutlet UIButton *dataButton;
@property (nonatomic,weak)IBOutlet UIButton *dislikeButton;
@property (nonatomic,weak)IBOutlet UIButton *likeButton;
@property (nonatomic,weak)IBOutlet UIButton *flowersButton;


@property (nonatomic,strong) CommendLikeViewController *likeViewController;
@end

@implementation CommendViewController

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
    self.title = @"推荐";
    // Do any additional setup after loading the view from its nib.
}
/**
 *  资料
 *
 *  @param sender
 */
- (IBAction)clickDataButton:(id)sender {
}
/**
 *  不稀饭
 *
 *  @param sender
 */
- (IBAction)clickDisLikeButton:(id)sender {
}
/**
 *  稀饭
 *
 *  @param sender
 */
- (IBAction)clickLikeButton:(id)sender {
    if (!_likeViewController) {
        self.likeViewController = [[CommendLikeViewController alloc]init];
    }
    [self.navigationController pushViewController:_likeViewController animated:YES];
}
/**
 *  送花
 *
 *  @param sender
 */
- (IBAction)sendFlowersButton:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
