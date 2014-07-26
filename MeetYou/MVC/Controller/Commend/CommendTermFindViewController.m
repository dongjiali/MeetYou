//
//  CommendTermFindViewController.m
//  MeetYou
//
//  Created by Curry on 14-7-13.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendTermFindViewController.h"
#import "CommendTermFindCell.h"
#import "CommendTermFindMocel.h"
#import "CityAndArea.h"

@interface CommendTermFindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)IBOutlet UITableView *tableView;

@property (nonatomic,strong) CommendTermFindMocel *termFindMocel;
@property (nonatomic,strong) HNAPickerView *pickerView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation CommendTermFindViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma -mark- view load
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_tableView registerClass:[CommendTermFindCell class] forCellReuseIdentifier:@"CommendTermFindCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"YaoCell"];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self setMembers];
}

/**
 *  取消
 *
 *  @param sender
 */
- (IBAction)dismissViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/**
 *  确定选择
 *
 *  @param sender
 */
- (IBAction)doneSelected:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma -mark- tableView delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {
        CommendTermFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommendTermFindCell" forIndexPath:indexPath];
        cell.textLabel.text = _titleArray[row];
        cell.detailTextLabel.text = _dataArray[row];
        return cell;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YaoCell" forIndexPath:indexPath];
        cell.textLabel.text = @"摇一摇";
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (indexPath.row) {
        case 0:{
            NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:1];
            for (int i =1 ; i < 100; i++) {
                [array addObject:[NSString stringWithFormat:@"%d",i]];
            }
            [_pickerView setItemsArray:@[array]];
            [_pickerView requestDate:^(NSArray *selectedArray) {
                _dataArray[indexPath.row] = selectedArray[0];
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
            break;
        case 1:
        {
            [_pickerView setItemsArray:@[@[@"中学",@"高中",@"大专",@"本科",@"硕士",@"博士"]]];
            [_pickerView requestDate:^(NSArray *selectedArray) {
                 _dataArray[indexPath.row]= selectedArray[0];
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
            break;
        case 2:
        {
            NSMutableArray *array = [CityAndArea province];
            [_pickerView setItemsArray:@[@[@"朝阳",@"海淀",@"东城",@"西城",@"昌平",@"丰台"]]];
            [_pickerView requestDate:^(NSArray *selectedArray) {
                 _dataArray[indexPath.row] = selectedArray[0];
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
            break;
        default:
            break;
    }
    [_pickerView showDatePickerView];
}

#pragma -mark- tableView dataSource
// section个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
    return _dataArray.count;
    }
    
    if (section == 1) {
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0;
}

- (void)setMembers
{
    self.termFindMocel = [[CommendTermFindMocel alloc]init];
    self.titleArray = @[@"年龄",@"学历",@"地区"];
    self.dataArray = [NSMutableArray arrayWithArray:@[_termFindMocel.age,_termFindMocel.education,_termFindMocel.region]];
    
    self.pickerView = [[HNAPickerView alloc]init];
    [_pickerView showTitleText:@"请选择"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end