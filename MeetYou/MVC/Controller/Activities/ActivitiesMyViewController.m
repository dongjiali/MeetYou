//
//  ActivitiesMyViewController.m
//  MeetYou
//
//  Created by Curry on 14-9-21.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesMyViewController.h"
#import "ActivitiesTableListCell.h"
#import "ActivitiesPublishViewController.h"
@interface ActivitiesMyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *activitiesArray;
@end

@implementation ActivitiesMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.\
    
    self.fabuActivitiesImet = [[UIBarButtonItem alloc]initWithTitle:@"发布活动" style:UIBarButtonItemStylePlain target:self action:@selector(fabuActivitiesImetClick:)];
    [self initialization];
}


- (void)initialization
{
    self.activitiesArray = [[NSMutableArray alloc]initWithArray:@[@"1"]];
    [self addObserver:self forKeyPath:@"valueChange" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ActivitiesTableListCell class] forCellReuseIdentifier:@"ActivitiesTableListCell"];// tableView
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"valueChange"])
    {
        [self.tableView reloadData];
    }
}

- (void)fabuActivitiesImetClick:(id)sender
{
    ActivitiesPublishViewController *viewControll = [[ActivitiesPublishViewController  alloc]init];
    viewControll.array = _activitiesArray;
    [self.nowNavigationController pushViewController:viewControll animated:YES];
}

- (UIBarButtonItem *)fabuActivitiesImet
{
    if (_fabuActivitiesImet) {
        return _fabuActivitiesImet;
    }
    return nil;
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
    return _activitiesArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%d------------%d",indexPath.section,indexPath.row);
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
