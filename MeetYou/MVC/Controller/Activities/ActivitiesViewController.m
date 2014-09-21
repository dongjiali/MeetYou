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
#import "ActivitiesMessageViewController.h"
#import "ActivitiesNearbyViewController.h"
#import "ActivitiesMyViewController.h"
@interface ActivitiesViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic,weak) IBOutlet UIButton *ActivitiesNearbyButton;
@property (nonatomic,weak) IBOutlet UIButton *ActivitiesMessageButton;
@property (nonatomic,weak) IBOutlet UIButton *ActivitiesMyButton;

@property (nonatomic,strong)ActivitiesMessageViewController *activitiesMessageViewController;
@property (nonatomic,strong)ActivitiesNearbyViewController *activitiesNearbyViewController;
@property (nonatomic,strong)ActivitiesMyViewController *activitiesMyViewController;

@property (nonatomic,strong)  UIBarButtonItem *clearAllImet;
@end

const int barItemCount = 3;

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
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * barItemCount, 0);
    
    UIBarButtonItem *leftImet = [[UIBarButtonItem alloc]initWithTitle:@"左" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick:)];
    self.navigationItem.leftBarButtonItem = leftImet;
    [self changeActivitiesNearbyViewController];
}

- (IBAction)selectActivitiesStatus:(UIButton *)sender
{
    if (sender.tag == 0) {
        [self changeActivitiesNearbyViewController];
    }
    
    if (sender.tag == 1) {
        [self changeActivitiesMessageViewController];
    }
    
    if (sender.tag == 2) {
        [self changeActivitiesMyViewController];
    }
    
}


- (void)changeActivitiesNearbyViewController
{
    if (!_activitiesNearbyViewController) {
        [self activitiesNearbyViewControllerInit];
        _activitiesNearbyViewController.view.frame = CGRectMake(0, 0, _scrollView.width,_scrollView.height);
        [_scrollView addSubview:_activitiesNearbyViewController.view];
    }
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    self.navigationItem.rightBarButtonItem = _activitiesNearbyViewController.shaixuanActivitiesImet;
    _activitiesNearbyViewController.nowNavigationController = self.navigationController;
}

- (void)changeActivitiesMessageViewController
{
    if (!_activitiesMessageViewController) {
        [self activitiesMessageViewControllerInit];
        _activitiesMessageViewController.view.frame = CGRectMake(_scrollView.width, 0, _scrollView.width,_scrollView.height);
        [_scrollView addSubview:_activitiesMessageViewController.view];
    }
    [_scrollView setContentOffset:CGPointMake(_scrollView.width, 0) animated:NO];
    self.navigationItem.rightBarButtonItem = _activitiesMessageViewController.clearAllImet;
    _activitiesMessageViewController.nowNavigationController = self.navigationController;
}

- (void)changeActivitiesMyViewController
{
    if (!_activitiesMyViewController) {
        [self activitiesMyViewControllerInit];
        _activitiesMyViewController.view.frame = CGRectMake(_scrollView.width * 2, 0, _scrollView.width,_scrollView.height);
        [_scrollView addSubview:_activitiesMyViewController.view];
    }
    [_scrollView setContentOffset:CGPointMake(_scrollView.width *2, 0) animated:NO];
    self.navigationItem.rightBarButtonItem = _activitiesMyViewController.fabuActivitiesImet;
    _activitiesMyViewController.nowNavigationController = self.navigationController;
}

- (void)activitiesMessageViewControllerInit
{
    if (!_activitiesMessageViewController) {
        self.activitiesMessageViewController =  [[ActivitiesMessageViewController alloc]init];
    }
}

- (void)activitiesNearbyViewControllerInit
{
    if (!_activitiesNearbyViewController) {
        self.activitiesNearbyViewController = [[ActivitiesNearbyViewController alloc]init];
    }
}

- (void)activitiesMyViewControllerInit
{
    if (!_activitiesMyViewController) {
        self.activitiesMyViewController= [[ActivitiesMyViewController alloc]init];
    }
}

-(void)leftItemClick:(id)sender{
    [[SliderViewController sharedSliderController] leftItemClick];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
