//
//  ActivitiesPublishViewController.m
//  MeetYou
//
//  Created by Curry on 14-9-21.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesPublishViewController.h"

@interface ActivitiesPublishViewController ()

@end

@implementation ActivitiesPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发布活动";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)activitiesPublishClick:(UIButton *)sender
{
    [_array addObject:@"4"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)cancelActivitiesPublishClick:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
