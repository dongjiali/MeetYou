//
//  NavigationController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "NavigationController.h"
@interface NavigationController ()
<UINavigationControllerDelegate>

@property (nonatomic, readonly) UIViewController *viewController;

@end

@implementation NavigationController

- (id)init
{
    // [[SliderViewController sharedSliderController] showContentControllerWithModel:@"NaviViewController"]; 方法内会调用此init方法，
    // 在这里创建rootViewController。
    //    _viewCtrl = [[ViewController1 alloc] init];
    //    self = [super initWithRootViewController:_viewCtrl];
    if (self)
    {
        
    }else{}
    return self;
}

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
