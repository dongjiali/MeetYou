//
//  ActivitiesViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesViewController.h"
#import "ActivitiesSearchViewController.h"
#import "ActivitiesTableListCell.h"
@interface ActivitiesViewController ()
@property (nonatomic,strong) NSMutableArray *activitiesArray;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end

@implementation ActivitiesViewController

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
    self.title = @"活动";
    // Do any additional setup after loading the view from its nib.
    [self setViews];
}

- (void)setViews
{
    UIBarButtonItem *leftImet = [[UIBarButtonItem alloc]initWithTitle:@"左" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick:)];
    self.navigationItem.leftBarButtonItem = leftImet;
    
    UIBarButtonItem *rightImet = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];
    self.navigationItem.rightBarButtonItem = rightImet;
    
}


- (void)initialization
{
//    self.activitiesArray = @[@"关于",@"客服",@"更多",@"注销"];
    [self.tableView registerClass:[ActivitiesTableListCell class] forCellReuseIdentifier:@"ActivitiesTableListCell"];// tableView
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivitiesTableListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivitiesTableListCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



-(void)leftItemClick:(id)sender{
    [[SliderViewController sharedSliderController] leftItemClick];
}

- (void)rightItemClick:(id)sender
{
    ActivitiesSearchViewController *viewControll = [[ActivitiesSearchViewController  alloc]init];
    [self.navigationController pushViewController:viewControll animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
