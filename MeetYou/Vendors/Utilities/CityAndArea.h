//
//  CityAndArea.h
//  HaiHangHui
//
//  Created by Curry on 14-7-18.
//  Copyright (c) 2014年 HaiHangHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityAndArea : NSObject
+(NSMutableArray*)province;
@end

/**
 *  地区模型
 */
@interface AreaModal : NSObject

@property(nonatomic,copy)NSString* state;
@property(nonatomic,strong)NSMutableArray* cities;

@end

/**
 *  省市省份模型
 */
@interface CityModal : NSObject

@property(nonatomic,copy)NSString* city;
@property(nonatomic,strong)NSArray* areas;

@end