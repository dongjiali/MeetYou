//
//  RegisterViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (nonatomic,strong) MTNetWork *netWork;
@end

@implementation RegisterViewController

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
    
    self.netWork = [[MTNetWork alloc]init];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushSeting:) name:GetWebInfoData object:nil];
    self.title = @"登陆";
    [self.navigationItem setHidesBackButton:YES];
}

- (IBAction)registerUser:(id)sender {
    [((UIButton *)sender) setImage:[UIImage imageNamed:@"btn_login_focus"] forState:UIControlStateSelected];
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kSinaRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"RegisterViewController"};
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK sendRequest:request];
}

- (void)pushSeting:(id)infoUrl
{
    [self.navigationController popViewControllerAnimated:NO];
    NSLog(@"%@",[infoUrl valueForKey:@"object"]);
    [_netWork getHttpURL:@"https://api.weibo.com/2/users/show.json" parameters:[infoUrl valueForKey:@"object"] completion:^(id results) {
        NSLog(@"%@",results);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self name:GetWebInfoData object:nil];
}
@end
