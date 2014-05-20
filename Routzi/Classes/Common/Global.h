//
//  Global.h
//
//
//  Created by Tapha Media Ltd on 1/20/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "TaxiData.h"

typedef enum {
    DEVICE_IPHONE_35INCH,
    DEVICE_IPHONE_40INCH,
    DEVICE_IPAD,
} DEVICE_TYPE;


typedef enum {
    IOS_7 = 3,
    IOS_6 = 2,
    IOS_5 = 1,
    IOS_4 = 0,
} IOS_VERSION;

IOS_VERSION gIOSVersion;

DEVICE_TYPE gDeviceType;
CGSize gScreenSize;

UIInterfaceOrientation gDeviceOrientation;

AppDelegate * gAppDelegate;


#define SCREEN_MENU	@"SCREEN_MENU"

#define SCREEN_HOME @"SCREEN_HOME"
#define STR_HOME_NAVTITLE @"NAV_TITLE"

#define STR_HOME_SEARCH_TITLE @"SEARCH_TITLE"
#define STR_HOME_SEARCH_BTN_CANCEL @"SEARCH_BTN_CANCEL"
#define STR_HOME_SEARCH_BTN_RESERVE @"SEARCH_BTN_RESERVE"
#define STR_HOME_SEARCH_TXT_FROM @"SEARCH_TXT_FROM"
#define STR_HOME_SEARCH_TXT_TO @"SEARCH_TXT_TO"
#define STR_HOME_SEARCH_MEM_1 @"SEARCH_MEM_1"
#define STR_HOME_SEARCH_MEM_2_5 @"SEARCH_MEM_2_5"
#define STR_HOME_SEARCH_MEM_6 @"SEARCH_MEM_6"
#define STR_HOME_SEARCH_PAY_CASH @"SEARCH_PAY_CASH"
#define STR_HOME_SEARCH_PAY_CARD @"SEARCH_PAY_CARD"
#define STR_HOME_SEARCH_PAY_ACCOUNT @"SEARCH_PAY_ACCOUNT"

#define STR_HOME_PAY_RECEIPT @"PAY_RECEIPT"
#define STR_HOME_PAY_CARD @"PAY_CARD"
#define STR_HOME_PAY_BTM @"PAY_BOTTOM"
#define STR_HOME_PAY_BTN @"PAY_BUTTON"
#define STR_HOME_PAY_CANCEL @"PAY_CANCEL"




#define SCREEN_ELEMENT @"SCREEN_ELEMENT"
#define STR_ELEMENT_NAVTITLE @"NAV_TITLE"


