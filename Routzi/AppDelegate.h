//
//  AppDelegate.h
//  Taxi
//
//  Created by Tapha Media Ltd on 9/5/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImageView+More.h"

@class MenuViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSNotificationCenter * notifyCenter;
    
    // For Strings of interfaces
	NSMutableDictionary * stringDicData;
    
    // Variable
    MenuViewController * menuController;
}

@property (strong, nonatomic) UIWindow *window;


- (void) getAllStrings;
- (NSString *) getStringInScreen:(NSString *)screenName strID:(NSString *)strID;

- (NSString *) getResourcePathWithFilename:(NSString *) filename withExt:(NSString *)ext;
- (NSString *) getResourcePathWithFilename:(NSString *) filename;
- (NSString *) getDocumentPathWithFilename:(NSString *) filename withExt:(NSString *)ext;
- (NSString *) getDocumentPathWithFilename:(NSString *) filename;


- (void) showAlertWithTitle:(NSString *)title
                    message:(NSString *)message
                   receiver:(id)receiver
          cancelButtonTitle:(NSString *)cancelButtonTitle
               otherButtons:(NSArray *)titles;


- (float) getRealWidthFrom:(float)height
                   content:(NSString *)content
                  fontname:(NSString *)fontname
                  fontsize:(float)fontsize
             lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (float) getRealHeightFrom:(float)width
                    content:(NSString *)content
                   fontname:(NSString *)fontname
                   fontsize:(float)fontsize
              lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (float) getRealWidthFrom:(float)height content:(NSString *)content
                      font:(UIFont *)font
             lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (float) getRealHeightFrom:(float)width content:(NSString *)content
                       font:(UIFont *)font
              lineBreakMode:(NSLineBreakMode)lineBreakMode;


@end
