//
//  UICustomSwitch.m
//
//
//  Created by Tapha Media Ltd on 03/08/13.
//  Copyright 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomSwitch.h"


@implementation UICustomSwitch

@synthesize on;


+ (UICustomSwitch *) viewFromStoryboard
{
    UICustomSwitch * vw = [SuperView viewFromStoryboard:@"UICustomSwitch"];
    
    [vw addGesture];
    [vw setOn:NO];
    
    return vw;
}


- (void) addGesture
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandle:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
}


- (void)setOn:(BOOL)turnOn animated:(BOOL)animated;
{
	on = turnOn;
    
    [self showState:animated];
}

- (void)setOn:(BOOL)turnOn
{
	[self setOn:turnOn animated:NO];
}


- (void) tapGestureHandle:(UITapGestureRecognizer *)gestureRecognizer
{
    on = !on;
    
    [self showState:YES];
    
    if (self.delegate) {
        [self.delegate didChangeValue:self];
    }
}


- (void) changeBG
{
    [imgvwBG setImage:[UIImage imageNamed: on ? @"switch_on_bg" : @"switch_off_bg"]];
}


- (void) showState:(BOOL)animated
{
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.1];
        
        [imgvwCursor setFrame:CGRectMake( on ? 15 : -5, -2, 41, 41 )];
        
        [UIView setAnimationDidStopSelector:@selector(changeBG)];
        [UIView commitAnimations];
    }
    else {
        [imgvwCursor setFrame:CGRectMake( on ? 15 : -5, -2, 41, 41 )];
        [self changeBG];
    }
    
    frmOriginal = imgvwCursor.frame;
}


@end
