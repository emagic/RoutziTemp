//
//  CustomNavigationBarView.m
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavigationBarView.h"


@implementation CustomNavigationBarView

@synthesize bgImageView;
@synthesize lblTitle;
@synthesize delegate;


+ (id)viewFromStoryboard {
    CustomNavigationBarView *view = (CustomNavigationBarView *)[SuperView viewFromStoryboard:@"CustomNavigationBarView"];
        
    return view;
}

- (void) showRightButton:(BOOL)bShow
{
    [_rightButton setHidden:!bShow];
}

- (void) showLeftButton:(BOOL)bShow
{
    [_rightButton setHidden:!bShow];
}

- (IBAction) navbarButton_Click:(id)sender
{
    if ([sender isEqual:_leftButton]) {
        if(self.delegate){
            if ([self.delegate respondsToSelector:@selector(didClickNavBarLeftButton)]) {
                [self.delegate didClickNavBarLeftButton];
            }
        }
    }
    else if ([sender isEqual:_rightButton]) {
        if(self.delegate){
            if ([self.delegate respondsToSelector:@selector(didClickNavBarRightButton)]) {
                [self.delegate didClickNavBarRightButton];
            }
        }
    }
    
}

@end
