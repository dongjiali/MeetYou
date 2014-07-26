//
//  HNAPicker.h
//  HNA_PickerView
//
//  Created by Curry on 14-4-3.
//  Copyright (c) 2014年 HaiHangHui. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum PickerType
{
    PickertypeDate = 0,
    PickertypeItem,
    
}PickerType;

typedef void (^SelectedDoneBlock)(NSArray *item);
typedef void (^scrollEndBlock)(NSArray *item);
@interface HNAPicker : UIView<UICollectionViewDelegate>
@property (nonatomic, assign)PickerType pickerType;
@property (nonatomic, strong)NSArray *itemsDataSource;
@property (nonatomic, copy)NSString *pickerTitleText;

- (void)selectedDone:(SelectedDoneBlock)block;
- (void)scrollerEnd:(scrollEndBlock)block;
- (void)setScrollViewContent:(NSArray *)selectedArray;
@end
