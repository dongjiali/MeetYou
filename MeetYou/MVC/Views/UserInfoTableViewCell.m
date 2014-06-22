//
//  UserInfoTableViewCell.m
//  MeetYou
//
//  Created by Curry on 14-6-22.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "UserInfoTableViewCell.h"

@implementation UserInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *xibArr = [[NSBundle mainBundle] loadNibNamed:@"UserInfoTableViewCell" owner:self options:nil];
        self = xibArr[0];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
