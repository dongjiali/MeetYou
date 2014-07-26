//
//  ShakeViewController.m
//  MeetYou
//
//  Created by Curry on 14-7-26.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ShakeViewController.h"
#import "CommendTermFindViewController.h"

@interface ShakeViewController ()
@property (nonatomic,strong) CommendTermFindViewController *termFindViewController; //筛选
@end

@implementation ShakeViewController

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
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
    [self becomeFirstResponder];
}
- (IBAction)backViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)moreItem:(id)sender {
    if (!_termFindViewController) {
        self.termFindViewController = [[CommendTermFindViewController alloc]init];
    }
    [self presentViewController:_termFindViewController animated:true completion:^{
        
    }];
}

#pragma mark yaoyiyao
- (BOOL)canBecomeFirstResponder
{
    return YES;// default is NO
}
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"开始摇动手机");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"stop");
    UIAlertView *yaoyiyao = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您摇动了手机，找到妹子吗？" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [yaoyiyao show];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"取消");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
