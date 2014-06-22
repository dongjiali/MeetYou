//
//  LeftViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "LeftViewController.h"
#import "SliderViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong)NSArray *leftTableTitle;
@end

@implementation LeftViewController

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

    NSString *userName = _userInfo;
    self.leftTableTitle = @[@"首页",@"推荐",@"活动",@"消息",@"个人",@"设置",];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.textLabel setText:_leftTableTitle[indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _leftTableTitle.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MainViewController"];
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"CommendNavigationController"];
            break;
        case 2:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"ActivitiesNavigationController"];
            break;
        case 3:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MessageNavigationController"];
            break;
        case 4:
            //user root view
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"UserInfoNavigationController"];
            break;
        case 5:
            //setting root view
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"SettingNavigationController"];
            break;
        default:
            break;
    }
}

@end