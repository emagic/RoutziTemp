//
//  SuperViewController.h
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Global.h"

@interface SuperViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UIImageView * imgvwBG;
}

- (SuperViewController *) viewFromStoryboard;
+ (SuperViewController *) viewFromStoryboard:(NSString *)storyboardID;


- (void) resize;

@end
