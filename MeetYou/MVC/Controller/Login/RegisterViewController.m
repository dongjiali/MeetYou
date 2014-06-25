//
//  RegisterViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<WBHttpRequestDelegate>
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
    NSLog(@"%@",[infoUrl valueForKey:@"object"]);
    NSDictionary *params = @{@"uid":[infoUrl valueForKey:@"object"][@"uid"],@"access_token":[infoUrl valueForKey:@"object"][@"access_token"]};
    [self.navigationController popViewControllerAnimated:NO];
    UserInfoManager.isLogin = YES;
    [self.view removeFromSuperview];
    self.view = nil;
//    WBHttpRequest * asiRequest = [WBHttpRequest requestWithURL:@"https://api.weibo.com/2/users/show.json" httpMethod:@"GET" params:params delegate:self withTag:@"getUserInfo"];
}

//请求失败回调方法
- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error
{
        NSLog(@"%@",error);
}

//请求成功回调方法
- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
   NSLog(@"%@",result);
    NSError *error;
    NSData  *data = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (json == nil)
    {
        NSLog(@"json parse failed \r\n");
        return;
    }
    NSString *screenname,*picture;
    screenname = [json objectForKey:@"screen_name"];
    picture    = [json objectForKey:@"profile_image_url"];
    
    NSLog(@"%@",screenname);
    NSLog(@"%@",picture);
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
