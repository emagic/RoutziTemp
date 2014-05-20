//
//  UICustomSwitch.h
//
//
//  Created by Tapha Media Ltd on 03/08/13.
//  Copyright 2013 Tapha Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SuperView.h"

@protocol UICustomSwitchDelegate;

@interface UICustomSwitch : SuperView<UIGestureRecognizerDelegate> {
	BOOL on;
	
    IBOutlet UIImageView * imgvwBG;
    IBOutlet UIImageView * imgvwCursor;
    
    IBOutlet UILabel * lblOn;
    IBOutlet UILabel * lblOff;
    
    CGRect frmOriginal;
}

@property(nonatomic,getter=isOn) BOOL on;
@property(weak, nonatomic) id<UICustomSwitchDelegate> delegate;

+ (UICustomSwitch *) viewFromStoryboard;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end


@protocol UICustomSwitchDelegate

@optional

- (void) didChangeValue:(UICustomSwitch *)cs;

@end