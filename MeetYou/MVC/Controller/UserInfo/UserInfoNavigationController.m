//
//  UserInfoNavigationController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserInfoNavigationController.h"
#import "UserInfoViewController.h"
@interface UserInfoNavigationController ()
@end

@implementation UserInfoNavigationController

- (id)init
{
        // is log in
         UserInfoViewController *viewController = [[UserInfoViewController alloc]init];
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
