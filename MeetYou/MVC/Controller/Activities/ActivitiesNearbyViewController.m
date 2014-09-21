//
//  ActivitiesNearbyViewController.m
//  MeetYou
//
//  Created by Curry on 14-9-21.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesNearbyViewController.h"
#import "ActivitiesSearchViewController.h"
#import "ActivitiesTableListCell.h"
#import "ActivitiesDetialViewController.h"
@interface ActivitiesNearbyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end

@implementation ActivitiesNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.shaixuanActivitiesImet = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(shaixuanActivitiesImetClick:)];
    [self initialization];
}


- (void)initialization
{
//    self.titleArray = @[@"关于",@"客服",@"更多",@"注销"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ActivitiesDetialViewController *viewController = [[ActivitiesDetialViewController alloc]init];
    [self.nowNavigationController pushViewController:viewController animated:YES];
}



- (void)shaixuanActivitiesImetClick:(id)sender
{
    ActivitiesSearchViewController *viewControll = [[ActivitiesSearchViewController  alloc]init];
    [self.nowNavigationController pushViewController:viewControll animated:YES];
}

- (UIBarButtonItem *)shaixuanActivitiesImet
{
    if (_shaixuanActivitiesImet) {
        return _shaixuanActivitiesImet;
    }
    return nil;
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
