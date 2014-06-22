//
//  UserInfoTableViewCell.h
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoTableViewCell : UITableViewCell
@property (nonatomic ,weak) IBOutlet UILabel *title;
@property (nonatomic ,weak) IBOutlet UITextField *text;
@end
