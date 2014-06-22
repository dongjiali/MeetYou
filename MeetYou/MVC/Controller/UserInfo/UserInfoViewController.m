//
//  UserInfoViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserInfoViewController.h"
#import "RegisterViewController.h"
#import "MTPhotoWall.h"
#import "UserInfoTableViewCell.h"
@interface UserInfoViewController()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate,MTPhotoWallDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIBarButtonItem *barButtonEdit;
@property (strong, nonatomic) UIBarButtonItem *barButtonDone;

@property (strong, nonatomic) MTPhotoWall *photoWall;
@property (strong, nonatomic) NSArray *infoDataGroup;
@property (strong, nonatomic) NSArray *infoArray;
@property (nonatomic) BOOL isEditModel;
@end

@implementation UserInfoViewController

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
//    RegisterViewController *registerViewControlle = [[RegisterViewController alloc]init];
//    [self.navigationController pushViewController:registerViewControlle animated:NO];
    [self setMember];
    [self setViews];
    self.barButtonEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit)];
    self.barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(actionDone)];
    self.navigationItem.rightBarButtonItem = self.barButtonEdit;
    self.navigationItem.leftBarButtonItem = nil;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.photoWall = [[MTPhotoWall alloc] initWithFrame:CGRectZero];
    [self.photoWall setPhotos:[NSArray arrayWithObjects:
                               @"http://www.weiphone.com/images_v3/logo.png",
                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041055480-L.jpg",
                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041513010-L.jpg",
                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041F4430-L.jpg",
                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-121204091R70-L.jpg",
                               @"http://cc.cocimg.com/bbs/attachment/upload/21/126211338811104.jpg", nil]];
    self.photoWall.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    self.isEditModel = NO;
}

- (void)setMember
{
    self.infoArray = @[@"  基本信息",@"年龄/星座                  23/水瓶座:",@"身高:                          176cm",@"体重:                          65kg",@"地区:                          北京 海淀",@"个性签名:                  人要靠自己",@"  更多信息",@"学历:                          本科",@"学校:                          北京大学",@"职业:                          程序猿",@"公司:                          牛X公司"];
}

- (void)setViews
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, 44, 44);
    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:leftBtn];
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)actionEdit
{
    self.navigationItem.rightBarButtonItem = self.barButtonDone;
    
    self.isEditModel = YES;
    [self.photoWall setEditModel:self.isEditModel];
    
    [self.tableView reloadData];
}

- (void)actionDone
{
    self.navigationItem.rightBarButtonItem = self.barButtonEdit;
    self.navigationItem.leftBarButtonItem = nil;
    
    self.isEditModel = NO;
    [self.photoWall setEditModel:self.isEditModel];
    
    [self.tableView reloadData];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _infoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cell = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:Cell];
    }
    
    cell.textLabel.text = _infoArray[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.photoWall;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.photoWall.frame.size.height;
}

#pragma mark -

- (void)photoWallPhotoTaped:(NSUInteger)index
{
    UIActionSheet *actionSheetTemp = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:@"删除图片"
                                                        otherButtonTitles:nil, nil];
    [actionSheetTemp showInView:self.view];
}

- (void)photoWallMovePhotoFromIndex:(NSInteger)index toIndex:(NSInteger)newIndex
{
    
}

- (void)photoWallAddAction
{
    [self.photoWall addPhoto:@"http://cc.cocimg.com/bbs/attachment/upload/92/1226921340986127.jpg"];
}

- (void)photoWallAddFinish
{
    
}

- (void)photoWallDeleteFinish
{
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [self.photoWall deletePhotoByIndex:0];
    }
}
@end