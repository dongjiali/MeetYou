//
//  CityAndArea.m
//  HaiHangHui
//
//  Created by Curry on 14-7-18.
//  Copyright (c) 2014年 HaiHangHui. All rights reserved.
//

#import "CityAndArea.h"

@implementation CityAndArea


+(NSMutableArray*)province{
    
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"]];
    
    
    NSMutableArray* provinces = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSDictionary* dic in array) {
        
        AreaModal* modal = [AreaModal alloc];
        
        modal.state = [dic objectForKey:@"state"];
        modal.cities = [NSMutableArray array];
        NSArray* citys = [dic objectForKey:@"cities"];
        
        for (NSDictionary* subDic in citys) {
            
            CityModal* modalCity = [CityModal alloc];
            modalCity.city = [subDic objectForKey:@"city"];
            modalCity.areas = [subDic objectForKey:@"areas"];
            [modal.cities addObject:modalCity];
        }
        [provinces addObject:modal];
    }
    return provinces;
}

@end


@implementation AreaModal

@end


@implementation CityModal

@end
