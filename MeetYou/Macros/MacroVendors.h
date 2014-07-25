//
//  MacroVendors.h
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#ifndef MeetYou_MacroVendors_h
#define MeetYou_MacroVendors_h

#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define ColorRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#define ColorHex(hex) [UIColor colorWithHex:hex];

#define NetWork_TimeOut  20
#define kSinaAppKey @"2137058799" /***注册后请替换掉这个***/
#define kSinaRedirectURI @"https://api.weibo.com/oauth2/default.html"

#define GetWebInfoData @"getWebInfoData"
#define SetLoginViewController @"setLoginViewController"

#endif
