//
//  ActivitiesSearchViewController.m
//  MeetYou
//
//  Created by Curry on 14-9-21.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesSearchViewController.h"

@interface ActivitiesSearchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation ActivitiesSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)doneButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
