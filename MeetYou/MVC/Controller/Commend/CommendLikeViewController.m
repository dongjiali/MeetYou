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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
