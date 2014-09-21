//
//  ActivitiesMessageViewController.m
//  MeetYou
//
//  Created by Curry on 14-9-21.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "ActivitiesMessageViewController.h"
#import "ActivitiesMessageListCell.h"
@interface ActivitiesMessageViewController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *messageArray;
@end

@implementation ActivitiesMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 self.clearAllImet = [[UIBarButtonItem alloc]initWithTitle:@"全部清空" style:UIBarButtonItemStylePlain target:self action:@selector(clearAllImetClick:)];
    [self initialization];
}

- (void)initialization
{
    self.messageArray = [[NSMutableArray alloc]initWithArray:@[@"1",@"2",@"3"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ActivitiesMessageListCell class] forCellReuseIdentifier:@"ActivitiesMessageListCell"];// tableView
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivitiesMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivitiesMessageListCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%d------------%d",indexPath.section,indexPath.row);
}


- (UIBarButtonItem *)clearAllImet
{
    if (_clearAllImet) {
        return _clearAllImet;
    }
    return  nil;
}

- (void)clearAllImetClick:(id)sender
{
    [_messageArray removeAllObjects];
    [_tableView reloadData];
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
