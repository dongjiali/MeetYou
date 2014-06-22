//
//  SettingNavigationController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "SettingNavigationController.h"
#import "SettingViewController.h"
@interface SettingNavigationController ()

@end

@implementation SettingNavigationController

- (id)init
{
     SettingViewController *viewController = [[SettingViewController alloc]init];
    self = [super initWithRootViewController:viewController];
    if (self)
    {
        
    }else{}
    return self;
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
