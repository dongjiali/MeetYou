//
//  CommendTermFindCell.m
//  MeetYou
//
//  Created by Curry on 14-7-13.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendTermFindCell.h"

@implementation CommendTermFindCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *xibArr = [[NSBundle mainBundle] loadNibNamed:@"CommendTermFindCell" owner:self options:nil];
        self = xibArr[0];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.size.height - 1, self.frame.size.width, 1)];
    view.backgroundColor = ColorRGB(209, 208, 212);
    [self addSubview:view];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
