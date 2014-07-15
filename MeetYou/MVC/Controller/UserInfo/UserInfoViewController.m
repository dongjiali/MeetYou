//
//  UserInfoViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserInfoViewController.h"
#import "MTPhotoWall.h"
#import "UserInfoTableViewCell.h"
#import  "VPViewController.h"
#import "UserLogoutView.h"
#import "VPImageCropperViewController.h"

#define ORIGINAL_MAX_WIDTH 640.0f

@interface UserInfoViewController()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate,MTPhotoWallDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, VPImageCropperDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIBarButtonItem *barButtonEdit;
@property (strong, nonatomic) UIBarButtonItem *barButtonDone;
@property (strong, nonatomic) UIBarButtonItem *barButtonBack;

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
    [self setMember];
    [self setViews];
    self.title = @"个人信息";
}

- (void)setMember
{
    self.infoArray = @[@"头像",@"年龄/星座                  23/水瓶座:",@"身高:                          176cm",@"体重:                          65kg",@"地区:                          北京 海淀",@"个性签名:                  人要靠自己",@"  更多信息",@"学历:                          本科",@"学校:                          北京大学",@"职业:                          程序猿",@"公司:                          牛X公司"];
}

- (void)setViews
{
//    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.frame = CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, 44, 44);
//    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
//    self.barButtonBack  = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
//    self.navigationItem.leftBarButtonItem = _barButtonBack;
    
    self.barButtonEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit)];
    self.barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(actionDone)];
    self.navigationItem.rightBarButtonItem = self.barButtonEdit;
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    self.photoWall = [[MTPhotoWall alloc] initWithFrame:CGRectZero];
//    [self.photoWall setPhotos:[NSArray arrayWithObjects:
//                               @"http://www.weiphone.com/images_v3/logo.png",
//                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041055480-L.jpg",
//                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041513010-L.jpg",
//                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-1212041F4430-L.jpg",
//                               @"http://www.cocoachina.com/cms/uploads/allimg/121204/4196-121204091R70-L.jpg",
//                               @"http://cc.cocimg.com/bbs/attachment/upload/21/126211338811104.jpg", nil]];
    [self.photoWall setPhotos:[NSArray arrayWithObjects:[UIImage imageNamed:@"addPhoto"], nil]];
    self.photoWall.delegate = self;
    
    [self.tableView setTableHeaderView:_photoWall];
    
    UserLogoutView *resultFooterView = [[UserLogoutView alloc] init];
    [resultFooterView.logoutButton addTarget:self action:@selector(logoutUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView setTableFooterView:resultFooterView];
    [self.view addSubview:self.tableView];
    
    self.isEditModel = NO;
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

//退出用户
- (void)logoutUser:(id)sender
{
    UserInfoManager.isLogin = NO;
     [[SliderViewController sharedSliderController] showContentControllerWithModel:@"CommendNavigationController"];
    [[NSNotificationCenter defaultCenter] postNotificationName:SetLoginViewController object:nil];
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
    self.isEditModel = NO;
    [self.photoWall setEditModel:self.isEditModel];
    
    [self.tableView reloadData];
}

- (void)actionCancel
{
    self.navigationItem.rightBarButtonItem = self.barButtonEdit;
    
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

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return self.photoWall;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return self.photoWall.frame.size.height;
//}

#pragma -mark- tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self setUserHeadImage];
    }
}

#pragma -mark- headViewimage
-(void)setUserHeadImage
{
    VPViewController *vpView =[[VPViewController alloc]init];
    [self.navigationController pushViewController:vpView animated:YES];
}

#pragma mark -

- (void)photoWallPhotoTaped:(NSUInteger)index
{
    UIActionSheet *actionSheetTemp = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:@"删除图片"
                                                        otherButtonTitles:nil, nil];
    actionSheetTemp.tag = 0;
    [actionSheetTemp showInView:self.view];
}

- (void)photoWallMovePhotoFromIndex:(NSInteger)index toIndex:(NSInteger)newIndex
{
    
}

- (void)photoWallAddAction
{
//    [self.photoWall addPhoto:@"http://cc.cocimg.com/bbs/attachment/upload/92/1226921340986127.jpg"];
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    choiceSheet.tag = 1;
    [choiceSheet showInView:self.view];
}

#pragma mark UIActionSheetDelegate

- (void)photoWallAddFinish
{
    
}

- (void)photoWallDeleteFinish
{
    
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
//    self.portraitImageView.image = editedImage;
    [self.photoWall addPhoto:editedImage];
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
    }];
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 0) {
        if (buttonIndex != actionSheet.cancelButtonIndex) {
            [self.photoWall deletePhotoByIndex:0];
        }
    }
    
    if (actionSheet.tag ==1 ) {
        if (buttonIndex == 0) {
            // 拍照
            if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                if ([self isFrontCameraAvailable]) {
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                }
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
            
        } else if (buttonIndex == 1) {
            // 从相册中选取
            if ([self isPhotoLibraryAvailable]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
        }

    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}


#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

@end